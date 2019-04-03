; ***REMOVED***
; to add
; !ehp
; ehp
; all weather commands
; tick
; !99rc !con !thief !thieving !warbands !pray !fletch !indecent !asylum !hello !remindwarbands !rotation !imfeelinglucky !slay
; other commands
on *:text:!whatis*:#:{
  if (!$2) { msg # What is what? }
  elseif ($2 == !07rswiki) { msg # Use !07rswiki _ to look something up on 2007scape Wiki. }
  elseif ($2 == !120) { msg # Use !120 and I will tell you the exact amount of xp for lvl 120. }
  elseif ($2 == !122) { msg # Use !122 and I will tell you the exact amount of xp for lvl 122. }
  elseif ($2 == !additionalcommands1 || $2 == !additionalcommands2) { Use !additionalcommands[1-2] for additional miscellaneous commands. }
  elseif ($2 == !adventure) { msg # !adventure <command> is a Harmonbot game where you can attack other people. Current commands are register, remove, health, attack <username>, respawn, death, users. You can also /w harmonbot <command>. }
  elseif ($2 == arts || $2 == imagrill || $2 == sarah) {
    if ($mid($chan,2-) == imagrill) { msg # That's who you're watching! }
    else { msg # Imagrill is another streamer I frequent. }
  }
  elseif ($2 == australianified) { msg # A 90-year-old fanatic humage time traveler with a 10 foot beard. He wo's. }
  elseif ($2 == !averagefps) { msg # Use !averagefps to check the average frames per second (fps) of the stream so far. }
  elseif ($2 == bandit) { msg # Bandit is one of Arts's cats. }
  elseif ($2 == !bday) { msg # Use !bday to find out the time left until Mikki's birthday. }
  elseif ($2 == cache) { msg # $guthixiancache }
  elseif ($2 == !cache) { msg # Use !cache to find out the time until the next Guthixian Cache. }
  elseif ($2 == !calc) { msg # Use !calc to perform basic arithmetic. Valid operations and operators: + - * / k m b }
  elseif ($2 == cat) { msg # https://en.wikipedia.org/wiki/Cat }
  elseif ($2 == !caught) { msg # Use !caught _ for Mikki to catch someone. }
  elseif ($2 == cheese) { msg # $cheese }
  elseif ($2 == !cheese) { msg # Use !cheese to find out what cheese is. }
  elseif ($2 == !clan) { msg # Use !clan to find out what clans Mikki is in. }
  elseif ($2 == !cml) { msg # Use !cml for Mikki's Crystal Math Labs link. }
  elseif ($2 == !commands) { msg # Use !commands and I will tell you my commands. }
  elseif ($2 == !ctof) { msg # Use !ctof _ to convert from Celcius (°C) to Fahrenheit (°F). }
  elseif ($2 == edate) { msg # http://www.urbandictionary.com/define.php?term=eDate }
  elseif ($2 == ehp) { msg # EHP is Efficient Hours Played. }
  elseif ($2 == !emotes) { msg # Use !emotes to see Mikki's subscriber emotes. }
  elseif ($2 == !fitom) { msg # Use !fitom _ _ to convert from feet (ft) and inches (in) to meters (m). }
  elseif ($2 == !ftoc) { msg # Use !ftoc _ to convert from Fahrenheit (°F) to Celcius (°C). }
  elseif ($2 == !fttom) { msg # Use !fttom _ to convert from feet (ft) to meters (m). }
  elseif ($2 == !glory) { msg # Use !glory to remind Mikki to change her glory amulet. }
  elseif ($2 == !google) { msg # See !google google }
  elseif ($2 == googer) { msg # See !googer googer }
  elseif ($2 == !grats ) { msg # Use !grats to congratulate someone. (Optional: !grats Name) }
  elseif ($2 == !gtooz) { msg # Use !gtooz _ to convert from grams (g) to ounces (oz). }
  elseif ($2 == !gtoozt) { msg # Use !gtoozt _ to convert from grams (g) to troy ounces (oz t). }
  elseif ($2 == guthixiancache) { msg # $guthixiancache }
  elseif ($2 == !guthixiancache) { msg # Use !guthixiancache to find out what Guthixian Cache is. }
  elseif ($2 == !gz ) { msg # Use !gz to congratulate someone. (Optional: !gz <name>) }
  elseif ($2 == harmon || $2 == harmon758) { msg # Harmon is my creator. }
  elseif ($2 == !harmon) { msg # Use !harmon to find out who Harmon is. }
  elseif ($2 == harmonbot) { msg # That's me! }
  elseif ($2 == !harmonbot) { msg # Use !harmonbot to find out who Harmonbot is. }
  elseif ($2 == !help) { msg # See !help }
  elseif ($2 == !highfive) { msg # Use !highfive _ to high five someone. }
  elseif ($2 == !hiscores) { msg # Use !hiscores to look someone up on the RS Hiscores. Default is rs3 and level. Use _'s for spaces in usernames. Format: !hiscores <username> <skill / total> <rs3 / 07 / rs3ironman / rs3hcironman / 07ironman / 07hcironman / 07deadman> <level / rank / xp> }
  elseif ($2 == house) { msg # https://en.wikipedia.org/wiki/House }
  elseif ($2 == !indecentcodehs) { msg # Use !indecentcode _ to look someone up on IndecentCode highscores. }
  elseif ($2 == illuminati) { msg # $illuminati }
  elseif ($2 == !illuminati) { msg # Use !illuminati to find out what the Illuminati is. }
  elseif ($2 == ironman) { msg # $ironman }
  elseif ($2 == !ironman) { msg # Use !ironman to find out what Ironman Mode is. }
  elseif ($2 == !kgtolb) { msg # Use !kgtolb _ to convert from kilograms (kg) to pounds (lb). }
  elseif ($2 == !kmtomi) { msg # Use !kmtomi _ to convert from kilometers (km) to miles (mi). }
  elseif ($2 == !lag) { msg # Use !lag when Mikki is lagging. }
  elseif ($2 == !level) { msg # Use !level _ to find out the amount of xp at a particular level. }
  elseif ($2 == !lbtokg) { msg # Use !lbtokg _ to convert from pounds (lb) to kilograms (kg). }
  elseif ($2 == life) { msg # $life }
  elseif ($2 == !life) { msg # Use !life to find out what life is. }
  elseif ($2 == !links) { msg # Use !links for links to Mikki's Twitter and Youtube. }
  elseif ($2 == love) { msg # $love }
  elseif ($2 == !love) { msg # Use !love to find out what love is. }
  elseif ($2 == man) { msg # https://en.wikipedia.org/wiki/Man }
  elseif ($2 == !mine) { msg # Use !mine to see Mikki's Mining levels. }
  elseif ($2 == !mining) { msg # Use !mining to see Mikki's Mining levels. }
  elseif ($2 == mikki || $2 == mikkiscape) {
    if ($mid($chan,2-) == mikkiscape) { msg # That's who you're watching! }
    else { msg # Mikkiscape is another streamer I frequent. }
  }
  elseif ($2 == !mikki) { msg # See !mikki }
  elseif ($2 == !mikkitime) { msg # Use !mikkitime to find out what time it is for Mikki. }
  elseif ($2 == !mitokm) { msg # Use !mitokm _ to convert from miles (mi) to kilometers (km). }
  elseif ($2 == !mods) { msg # Use !mods to see what mods are currently in the chat. }
  elseif ($2 == motorboat) { msg # Motorboat is one of Arts's cats. }
  elseif ($2 == !mtofi) { msg # Use !mtofi _ to convert from meters (m) to feet (ft) and inches (in). }
  elseif ($2 == !mtoft) { msg # Use !mtoft _ to convert from meters (m) to feet (ft). }
  elseif ($2 == !music) { msg # Use !music to see Mikki's Spotify playlist. }
  elseif ($2 == !nightbot) { msg # See !nighbot }
  elseif ($2 == nig) { msg # Nice try, 2kjax. }
  elseif ($2 == !nudes) { msg # See !nudes }
  elseif ($2 == !noob) { msg # Use !noob _ to call someone a noob. }
  elseif ($2 == !oztog) { msg # Use !oztog _ to convert from ounces (oz) to grams (g). }
  elseif ($2 == !oztoozt) { msg # Use !oztoozt _ to convert from ounces (oz) to troy ounces (oz t). }
  elseif ($2 == !ozttog) { msg # Use !ozttog _ to convert from troy ounces (oz t) to grams (g). }
  elseif ($2 == !ozttooz) { msg # Use !ozttooz _ to convert from troy ounces (oz t) to ounces (oz). }
  elseif ($2 == !pi) { msg # Use !pi for an approximate value of pi. }
  elseif ($2 == pmfornudes) { msg # PM him for nud's }
  elseif ($2 == !points) { msg # You get 1 point for every minute that you are watching the stream while it's online. As of right now, they're not used for anything. }
  elseif ($2 == !poke) { msg # Use !poke _ to poke someone. }
  elseif ($2 == !pouch) { msg # Use !pouch to remind Mikki to repair her pouch. }
  elseif ($2 == !puppy) { msg # See !puppy }
  elseif ($2 == purringles) { msg # A noob. }
  elseif ($2 == !randomviewer) { msg # Use !randomviewer to select a random person watching the stream. }
  elseif ($2 == !rc) { msg # Use !rc to see Mikki's Runecrafting levels. }
  elseif ($2 == !remindcache) { msg # Use !remindcache _ and I will remind you _ minutes before Guthixian Cache. (Default is 5 if no _ given) }
  elseif ($2 == !repair) { msg # Use !repair to remind Mikki to repair her pouch. }
  elseif ($2 == !roulette) { msg # Use !roulette to play roulette. Mod only options: on, off }
  elseif ($2 == !rps) { msg # Use !rps _ to play rock, paper, scissors. Options: rock, paper, scissors; Mod only: on, off }
  elseif ($2 == !rswiki) { msg # Use !rswiki _ to look something up on Runescape Wiki. }
  elseif ($2 == !rswiki07) { msg # Use !rswiki07 _ to look something up on 2007scape Wiki. }
  elseif ($2 == !runecrafting) { msg # Use !runecrafting to see Mikki's Runecrafting levels. }
  elseif ($2 == runescape) { msg # http://runescape.wikia.com/wiki/Runescape http://2007.runescape.wikia.com/wiki/Runescape http://en.wikipedia.org/wiki/Runescape }
  elseif ($2 == !runetracker) { msg # Use !runetracker for Mikki's Runetracker links. }
  elseif ($2 == !sneeze) { msg # Use !sneeze [2-10] when Arts sneezes. Default is 1. }
  elseif ($2 == !spotify) { msg # Use !spotify to see Mikki's Spotify playlist. }
  elseif ($2 == squeak) { msg # Squeak is one of Arts's cats. }
  elseif ($2 == stats) { msg # $stats }
  elseif ($2 == !stats) { msg # Use !stats to see Mikki's stats. }
  elseif ($2 == !subscribe) { msg # Use !suscribe for the link to subscribe to Mikkiscape. }
  elseif ($2 == !tick) { msg # Use !tick to see how many ticks Mikki has wasted. }
  elseif ($2 == !time) { msg # Use !time _ to find out the time at a particular place. See !time help. }
  elseif ($2 == tirelessgod || $2 == jon) { msg # That's who you're watching! }
  elseif ($2 == !tns) { msg # See !tns }
  elseif ($2 == !totalxp) { msg # Use !totalxp to see Mikki's total xp. }
  elseif ($2 == trev_rs) { msg # He talks to his nipples. }
  elseif ($2 == !unitconversions) { msg # Use !unitconversions to see all unit conversion commands. }
  elseif ($2 == !uptime) { msg # Use !uptime to find out how long the stream has been live. }
  elseif ($2 == !weather) { msg # See !weather help }
  elseif ($2 == !whatis) { msg # That's the command you just used! Use it and I will tell you what certain things or commands are. }
  elseif ($2 == !wiki) { msg # Use !wiki _ to look something up on Wikipedia. }
  elseif ($2 == !xpat) { msg # Use !xpat _ to see what level a particular amount of xp is at. }
  elseif ($2 == !xpbetween) { msg # Use !xpbetween _ _ to see how much xp is between two particular levels. }
  elseif ($2 == zezima) { msg # $zezima }
  elseif ($2 == !zezima) { msg # Use !zezima to find out who Zezima is. }
  elseif ($2 isnum && $4 isnum && ($3 == + || $3 == - || $3 == * || $3 == / || $3 == ^ || $3 == %)) {
    msg # $2- = $calc($2-)
  }
  elseif ($define($2)) { msg # $capital(%define_word) $+ : $define($2) }
  else { msg # I don't know what that is. Try !google !wiki !rswiki !rswiki07 }
}

alias cheese return http://en.wikipedia.org/wiki/Cheese
alias guthixiancache return runescape.wikia.com/wiki/Guthixian_Cache
alias illuminati return http://en.wikipedia.org/wiki/Illuminati
alias ironman return runescape.wikia.com/wiki/Ironman_Mode
alias life return http://en.wikipedia.org/wiki/Life
alias love return http://en.wikipedia.org/wiki/Love https://www.youtube.com/watch?v=HEXWRTEbj1I
alias zezima return http://rsplayers.wikia.com/wiki/Zezima
