
import discord
from discord.ext import commands

import asyncio
import json
import sys
import traceback
import tweepy

import clients
import credentials
from modules import logging
from modules import utilities
from utilities import checks

def setup(bot):
	bot.add_cog(Twitter(bot))

class TwitterStreamListener(tweepy.StreamListener):
	
	def __init__(self, bot):
		super().__init__()
		self.bot = bot
		self.stream = None
		self.feeds = {}
		self.reconnect_ready = asyncio.Event()
		self.reconnect_ready.set()
		self.reconnecting = False
	
	def __del__(self):
		self.stream.disconnect()
	
	async def start_feeds(self, *, feeds = None):
		if self.reconnecting:
			await self.reconnect_ready.wait()
			return
		self.reconnecting = True
		await self.reconnect_ready.wait()
		self.reconnect_ready.clear()
		if feeds: self.feeds = feeds
		if self.stream: self.stream.disconnect()
		self.stream = tweepy.Stream(auth = clients.twitter_api.auth, listener = self)
		self.stream.filter(follow = set([id for feeds in self.feeds.values() for id in feeds]), **{"async" : "True"})
		self.bot.loop.call_later(120, self.reconnect_ready.set)
		self.reconnecting = False
	
	async def add_feed(self, channel, handle):
		self.feeds[channel.id] = self.feeds.get(channel.id, []) + [clients.twitter_api.get_user(handle).id_str]
		# TODO: Check if stream already following
		await self.start_feeds()
	
	async def remove_feed(self, channel, handle):
		self.feeds[channel.id].remove(clients.twitter_api.get_user(handle).id_str)
		await self.start_feeds() # necessary?
	
	def on_status(self, status):
		## print(status.text)
		if not status.in_reply_to_status_id and status.user.id_str in set([id for feeds in self.feeds.values() for id in feeds]):
			# TODO: Settings for including replies, retweets, etc.
			for channel_id, channel_feeds in self.feeds.items():
				if status.user.id_str in channel_feeds:
					embed = discord.Embed(title = '@' + status.user.screen_name, url = "https://twitter.com/{}/status/{}".format(status.user.screen_name, status.id), description = status.text, timestamp = status.created_at, color = clients.twitter_color)
					embed.set_author(name = status.user.name, icon_url = status.user.profile_image_url)
					embed.set_footer(text = "Twitter", icon_url = clients.twitter_icon_url)
					channel = self.bot.get_channel(channel_id)
					if channel:
						self.bot.loop.create_task(self.bot.send_message(channel, embed = embed))
	
	def on_error(self, status_code):
		print("Twitter Error: {}".format(status_code))
		return False

class Twitter:
	
	def __init__(self, bot):
		self.bot = bot
		self.stream_listener = TwitterStreamListener(bot)
		utilities.create_file("twitter_feeds", content = {"channels" : {}})
		with open("data/twitter_feeds.json", 'r') as feeds_file:
			self.feeds_info = json.load(feeds_file)
		self.task = self.bot.loop.create_task(self.start_twitter_feeds())
	
	def __unload(self):
		self.stream_listener.stream.disconnect()
		self.task.cancel()
	
	@commands.group(invoke_without_command = True)
	@checks.is_permitted()
	async def twitter(self, ctx):
		'''Twitter'''
		pass
	
	@twitter.command(name = "status")
	@checks.not_forbidden()
	async def twitter_status(self, ctx, handle : str):
		'''Get twitter status'''
		tweet = clients.twitter_api.user_timeline(handle, count = 1)[0]
		embed = discord.Embed(title = '@' + tweet.user.screen_name, url = "https://twitter.com/{}/status/{}".format(tweet.user.screen_name, tweet.id), description = tweet.text, timestamp = tweet.created_at, color = 0x00ACED)
		avatar = ctx.message.author.default_avatar_url if not ctx.message.author.avatar else ctx.message.author.avatar_url
		embed.set_author(name = ctx.message.author.display_name, icon_url = avatar)
		embed.set_footer(text = tweet.user.name, icon_url = tweet.user.profile_image_url)
		await self.bot.say(embed = embed)
	
	@twitter.command(name = "add", aliases = ["addhandle", "handleadd"])
	@checks.is_permitted()
	async def twitter_add(self, ctx, handle : str):
		'''
		Add a Twitter handle to a text channel
		A delay of up to 2 min. is possible due to Twitter rate limits
		'''
		if handle in self.feeds_info["channels"].get(ctx.message.channel.id, {}).get("handles", []):
			await self.bot.embed_reply(":no_entry: This text channel is already following that Twitter handle")
			return
		message, embed = await self.bot.embed_reply(":hourglass: Please wait")
		try:
			await self.stream_listener.add_feed(ctx.message.channel, handle)
		except tweepy.error.TweepError as e:
			embed.description = ":no_entry: Error: {}".format(e)
			await self.bot.edit_message(message, embed = embed)
			return
		if ctx.message.channel.id in self.feeds_info["channels"]:
			self.feeds_info["channels"][ctx.message.channel.id]["handles"].append(handle)
		else:
			self.feeds_info["channels"][ctx.message.channel.id] = {"name" : ctx.message.channel.name, "handles" : [handle]}
		with open("data/twitter_feeds.json", 'w') as feeds_file:
			json.dump(self.feeds_info, feeds_file, indent = 4)
		embed.description = "Added the Twitter handle, [`{0}`](https://twitter.com/{0}), to this text channel".format(handle)
		await self.bot.edit_message(message, embed = embed)
	
	@twitter.command(name = "remove", aliases = ["delete", "removehandle", "handleremove", "deletehandle", "handledelete"])
	@checks.is_permitted()
	async def twitter_remove(self, ctx, handle : str):
		'''
		Remove a Twitter handle from a text channel
		A delay of up to 2 min. is possible due to Twitter rate limits
		'''
		try:
			self.feeds_info["channels"].get(ctx.message.channel.id, {}).get("handles", []).remove(handle)
		except ValueError:
			await self.bot.embed_reply(":no_entry: This text channel isn't following that Twitter handle")
		else:
			with open("data/twitter_feeds.json", 'w') as feeds_file:
				json.dump(self.feeds_info, feeds_file, indent = 4)
			message, embed = await self.bot.embed_reply(":hourglass: Please wait")
			await self.stream_listener.remove_feed(ctx.message.channel, handle)
			embed.description = "Removed the Twitter handle, [`{0}`](https://twitter.com/{0}), from this text channel.".format(handle)
			await self.bot.edit_message(message, embed = embed)

	@twitter.command(aliases = ["handle", "feeds", "feed", "list"])
	@checks.not_forbidden()
	async def handles(self, ctx):
		'''Show Twitter handles being followed in a text channel'''
		await self.bot.embed_reply('\n'.join(self.feeds_info["channels"].get(ctx.message.channel.id, {}).get("handles", [])))
		# TODO: Add message if none
	
	async def start_twitter_feeds(self):
		await self.bot.wait_until_ready()
		feeds = {}
		for channel_id, channel_info in self.feeds_info["channels"].items():
			for handle in channel_info["handles"]:
				try:
					feeds[channel_id] = feeds.get(channel_id, []) + [clients.twitter_api.get_user(handle).id_str]
				except tweepy.error.TweepError as e:
					if e.api_code == 50:
					# User not found
						continue
					else:
						print("Exception in Twitter Task", file = sys.stderr)
						traceback.print_exception(type(e), e, e.__traceback__, file = sys.stderr)
						logging.errors_logger.error("Uncaught Twitter Task exception\n", exc_info = (type(e), e, e.__traceback__))
						return
		await self.stream_listener.start_feeds(feeds = feeds)

