# minetest-bot-collection<br />
Easily installable bots that simulate user input to help you play minetest (Especially recommended for Rubenwardys CTF) (personal use License plus the Rule that You are not allowed to publish copys or work based on this)
# !Regarding security!
This shitware was insecure for long times, allowing anything that could print to minetest output (so basically the minetest servers you use it on) while it was running to take over the machine by injecting shellscript commands.
I was informed about this long ago by Rubenwardy, but shook it off somehow.
I still dont regard this to be a major thread, since the attack would have to come from a minetest server you use the cheat on and be specifically designed for (the old version of) this program, and literally noone uses this shitware, so I don't think anyone will go and craft an attack against it.
Finally, I patched this obvious flaw.
Still this program may present a minor security risk due to the inherent design flaws, as it may allow someone who already hacked you to further their privileges (idk). I regard this a minor security risk, because really, if someones hacked you there was already some other weak spot, and there will likely also be another weak spot they can use to further their privileges (And still, who in hell would attack this shitware literally noone uses?!). 
However, I would not suggest to install this nor any games on a platform where security is paramount, really!!!
I would not want to bet that the other "Gamedevs" do a much better job than me regarding security (doing better than I did isn't hard tho LOL, in fact doing as bad as I did is)...
# PLZ PLZ PLZ Make youtube video if you like my bot :{ )
My bot got a bit popular here :{ ), but since not everybody is familiar with github, I'd like it if it where present on youtube as well, but since I'm not very good at making videos (and I'm working on better ctf), I'd like some users to do that :{ ).
also, If that bot gets really popular, I may make new, better bots, and add them to this collection.
Don't forget to send me (kai_gerd_mueller@gmx.de) an email, containing the youtube link, so i can add a link to the video in this file.
Thanks in advance, KGM.
# Videos
None by now :{ (
# AutoClick (will not be detected by rubenwardys anticheat system by now)
# if you dont mind being banned from time to time (CTF), just use this :)
# if ruben updates his anticheat, it may ban you again. if you don't want that, switch it off when match is about to end using .noappls :] 
# if you got banned, contact me (kai_gerd_mueller@gmx.de), and i will fix that in the next version.
# Install:
know how to execute shellscript?<br />
execute the installer script in this repository with sudo.<br />
don't like shell?<br />
mark the intaller jar as executable, execute it and enter password when requested. be PATIENT!<br />
All files are in this repository.<br />
# About:
this is a bot mainly used for pvp.
It has 3 features:
# Recommended:
# Auto eat apples:
if you lost plenty of health, this eats apples to regenerate you so you can HARDLY DIE (ALMOST IMPOSSIBLE) with enough of them. TELL THE PROGRAM WHERE THE APPLES ARE IN YOUR INVENTORY. TELL PROGRAM APPLE COUNT IN INVENTORY WHEN IT GOT CHANGED BY ANYTHING EXCEPT THE PROGRAM ITSELF (DEATH,FARMED MORE APPLES,MOVED SOME,ETC), ELSE IT MAY DISTURB YOU TRYING TO EAT NONEXISTENT APPLES!<br /><br />
ALSO, IT IS RECOMMENDED TO USE UPDSTACK FREQUENTLY EVEN IF THERE WERE NO SPECIAL EVENTS, SINCE LAG CAN RESULT IN THE PROBLEM THAT THE PROGRAM "EATS" LESS APPLES THAN IT THINKS IT DID, SO YOU DIE WITH APPLES IN INVENTORY BECAUSE PROGRAM THINKS THERE ARE NO MORE, BUT THIS IS ONLY NECECARY IF YOU fOUGHT MUCH DURING THE LAST MINUTES.<br /><br />
When restarted this is on.
Enable it by typing .apples into chat.
Disable it by typing .noappls into chat.
Tell it where apples are by typing .updstack into chat.
How .updstack works:
For programm, your inventory looks like this:<br />
|"""""""""""""""""""""""""""""""""""""""""""""<br />
|<br />
|0|1|2|3|4|5|6|7|<br />
|^ ^ ^ ^ ^ ^ ^ ^<br />
||o|o|o|o|o|o|o|7. stack, free-for-use<br />
||o|o|o|o|o|o|<br />
||o|o|o|o|o|o|6. stack, free-for-use<br />
||o|o|o|o|o|<br />
||o|o|o|o|o|5. stack, free-for-use<br />
||o|o|o|o|<br />
||o|o|o|o|4. stack, free-for-use<br />
||o|o|o|<br />
||o|o|o|3. stack, free-for-use<br />
||o|o|<br />
||o|o|2. stack, free-for-use<br />
||o|<br />
||o|1. stack, free-for-use<br />
||<br />
||0. stack, reserved for sword!<br />
|<br />
""""""""""""""""""""""""""""""""""""""""""""""<br />
 ONLY the FREE FOR USE STACKS can be used to deposit apples that can be eaten automatically!
# the BASIC WAY OF USING .updstack:
 .updstack <number of apples in 1. stack> <number of apples in 2. stack> <number of apples in 3. stack> <number of apples in 4. stack> <number of apples in 5. stack> <number of apples in 6. stack> <number of apples in 7. stack>
 (if there are no apples in a stack,number of apples in that stack is 0)
# the QUICK WAY OF USING .updstack:
like the basic way, but if all stacks on the right of an empty stack are empty too, you can leave that stacks out instead of writing a 0 for each.
# not recommended, optional (if you like that features, you can enable them. I don't like them that much.)
# Autojump:
You jump when hit!
When restarted this is off.
Enable it by typing .autojump into chat.
Disable it by typing .noautojump into chat.
# Punch back:
You punch with wielded Item when hit, you quickly use shooter weapons (rubenwardys ctf (ONLY))!
When restarted this is off.
Enable it by typing .hit2 into chat.
Disable it by typing .nohit2 into chat.
