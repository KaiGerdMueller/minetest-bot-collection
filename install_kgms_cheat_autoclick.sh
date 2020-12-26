echo "KGM : STARTING INSTALL OF KGM'S CHEAT"
echo "@main : INSTALLING JPYPE"
no_su_user_old=$SUDO_USER
sudo apt-get update
sudo apt-get install python-jpype
echo "@main : FINISHED INSTALLING JPYPE"
if [ ! -d "$HOME/.minetest/clientmods" ]; then
echo "@main : DIDN'T FIND CLIENTMOD DIRECTORY, CREATING IT"
mkdir -p "$HOME/.minetest/clientmods"
sudo chown -hR "$no_su_user_old" "$HOME/.minetest/clientmods"
echo "@main : FINISHED CREATING CLIENTMOD DIRECTORY"
fi
echo "@main : WRITING PYTHON FILE"
echo 'import subprocess
import subprocess, time, sys
from jpype import *
startJVM(getDefaultJVMPath())
robot = java.awt.Robot()
stacks = []
appleslist = [java.awt.event.KeyEvent.VK_2,java.awt.event.KeyEvent.VK_3,java.awt.event.KeyEvent.VK_4,java.awt.event.KeyEvent.VK_5,java.awt.event.KeyEvent.VK_6,java.awt.event.KeyEvent.VK_7,java.awt.event.KeyEvent.VK_8]
def click():
    java.lang.Thread.sleep(25)
    robot.mousePress(java.awt.event.InputEvent.BUTTON1_MASK)
    java.lang.Thread.sleep(25)
    robot.mouseRelease(java.awt.event.InputEvent.BUTTON1_MASK)
def sword():
    robot.keyPress(java.awt.event.KeyEvent.VK_1)
    robot.keyRelease(java.awt.event.KeyEvent.VK_1)
def jump():
    java.lang.Thread.sleep(25)
    robot.keyPress(java.awt.event.KeyEvent.VK_SPACE)
    java.lang.Thread.sleep(25)
    robot.keyRelease(java.awt.event.KeyEvent.VK_SPACE)
def apples(i):
    if i < 7:
        robot.keyPress(appleslist[i])
        robot.keyRelease(appleslist[i])
def stack_c(c):
    c.pop(0)
    for i in range(0,len(c)):
        c[i] = int(c[i])
    global stacks
    stacks = c
def eatapples(n,c):
    apples(c)
    for i in range(0,n):
        click()
def megashoot():
    for i in range(0,20):
        click()
def megashoot_2():
    for i in range(0,20):
        java.lang.Thread.sleep(50)
        robot.mousePress(java.awt.event.InputEvent.BUTTON1_MASK)
        java.lang.Thread.sleep(50)
        robot.mouseRelease(java.awt.event.InputEvent.BUTTON1_MASK)
dic = {"pymouseclick":["xte","'"'mouseclick 1'"'"]}
cmd = ["rsync.exe", "-vaz", "-P", "source/" ,"dest/"]

p = subprocess.Popen(["minetest"],
                     stdout=subprocess.PIPE,
                     stderr=subprocess.STDOUT)
def split_apples_cmd(ammount):
    global stacks
    for i in range(len(stacks)):
        stack = stacks[ i]
        if stack > 0:
            if stack-ammount < 0:
                ammount = ammount-stack
                stacks[i] = 0
                eatapples(stack,i)
            else:
                stacks[i] = stack-ammount
                eatapples(ammount,i)
                break
    sword()
for line in iter(p.stdout.readline, b'"''"'):
    line = str(line)
    if str.find(line,"#execute<type=me>") != -1:
        cmd = str.split(str.split(line,"`")[1]," ")
        if cmd[0] == "eatapples":
            split_apples_cmd(int(cmd[1]))
        elif cmd[0] == "click":
            click()
        elif cmd[0] == "jump":
            jump()
        elif cmd[0] == "shoot":
            megashoot()
        elif cmd[0] == "shootslow":
            megashoot_2()
        elif cmd[0] == "stacks":
            stack_c(cmd)
shutdownJVM()' > "$HOME/.minetest/clientmods/kgms_cheat_autoclick.py"
echo "@main : FINISHED WRITING PYTHON FILE"
if [ ! -f "$HOME/.minetest/clientmods/mods.conf" ]; then
echo "@main : DIDN'T FIND CLIENTMOD CONF FILE, CREATING IT"
echo "" > "$HOME/.minetest/clientmods/mods.conf"
echo "@main : FINISHED CREATING CLIENTMOD CONF FILE"
fi
cd "$HOME/.minetest/clientmods"
echo "@main : CREATING MOD DIR"
mkdir -p "kgms_cheat_autoclick"
echo "@main : FINISHED CREATING MOD DIR"
cd $HOME
echo "@main : WRITING LUA FILE"
echo 'os.pycmd = function(data)
print("#execute<type=me>`"..data.."`")
end
local t = 0
local player_key_table = {[1]="leftclick",[0] = "rightclick",[7] = "sneak",[3] = "e",[4] = "space",[5] = "d",[6] = "a",[7] = "s",[8] = "w"}
pipe = 0
hit = function()
	local hp = minetest.localplayer:get_hp()
	if hp == 1 then
		return
	end
	local hp_delay = math.ceil((20-hp)/2)
	local time = minetest.get_us_time()
	if (hp < 12) and apples and ((time-pipe) > -(hp_delay*50000)) then
	if (pipe-time) > 0 then
	minetest.after((pipe-time)/1000000.0,os.pycmd,"eatapples "..hp_delay)
	else
	os.pycmd("eatapples "..hp_delay)
	end
	if time > pipe then
	pipe = time+(hp_delay*50000)
	else
	pipe = pipe+(hp_delay*50000)
	end
	elseif time > pipe then
	os.pycmd("click")
	pipe = time+50000
	end
end
minetest.register_globalstep(function()
	if minetest.localplayer then
	local c = minetest.localplayer:get_control()
		local ti = minetest.get_us_time()
		if secondhit and c.left and ti > pipe+200000 then
			local n = minetest.get_wielded_item():get_name()
			if string.find(n,"shooter:") then
			if string.find(n,"crossbow") then
			os.pycmd("shoot")
			pipe = ti+50000*21
			else
			os.pycmd("shootslow")
			pipe = ti+100000*21
			end
			else
			hit()
			end
		end
		if jump and c.left and ti > pipe then
			os.pycmd("jump")
			pipe = ti+50000
		end 
	end
end)
apples = true
secondhit = false
jump = false
minetest.register_chatcommand("apples", {
	params = "",
	description = "apples",
	func = function(name, param)
		apples = true
	end,
})
minetest.register_chatcommand("noappls", {
	params = "",
	description = "noappls",
	func = function(name, param)
		apples = false
	end,
})
minetest.register_chatcommand("hit2", {
	params = "",
	description = "second hit",
	func = function(name, param)
		secondhit = true
	end,
})
minetest.register_chatcommand("updstack", {
	params = "",
	description = "second hit",
	func = function(param)
		if param and param ~= "" then
		for i in string.gmatch(param, "%S+") do
			if not tonumber(i) then
				minetest.display_chat_message("FAIL")
				return
			end
		end
		os.pycmd("stacks "..param)
		else
		minetest.display_chat_message("FAIL")
		end
	end,
})
minetest.register_chatcommand("nohit2", {
	params = "",
	description = "no  second hit",
	func = function(name, param)
		secondhit = false
	end,
})
minetest.register_chatcommand("autojump", {
	params = "",
	description = "auto jump",
	func = function(name, param)
		jump = true
	end,
})
minetest.register_chatcommand("noautojump", {
	params = "",
	description = "no  auto jump",
	func = function(name, param)
		jump = false
	end,
})
minetest.register_on_damage_taken(hit)' > "$HOME/.minetest/clientmods/kgms_cheat_autoclick/init.lua"
sudo chown -hR "$no_su_user_old" "/$HOME/.minetest/clientmods/kgms_cheat_autoclick"
echo "@main : FINISHED WRITING LUA FILE"
echo "@main : ENABLING MOD"
sudo chown "$no_su_user_old" "./minetest/clientmods/mods.conf"
echo 'load_mod_kgms_cheat_autoclick = true' >> "$HOME/.minetest/clientmods/mods.conf"
echo "@main : FINISHED ENABLING MOD"
echo "@main : ADDING DESKTOP ICON IMAGE FILE"
echo "iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAABHNCSVQICAgIfAhkiAAAAAlwSFlz
AAAOxAAADsQBlSsOGwAAAq1JREFUeJzt3G12qyAUhWHMysCcWdOZZWb2ly6rhy8F3Oj7/LnrGhMt
O8IBbZ0DAAAAAACAx7D5/3TJWTzPtt0X7+2Gz+dT9UyeLta+rzangVQEIoZAxBCIGAIRs6uynu4n
o8r8rVCREojBO0lYqTVho8sSQyBiCEQMgYghEDGHq6yc8tC5OiViLVcueZ8qe1PKQ+f6W9On7MXi
1BXS2ze/B3RZYrhCDF0O6ldVTaFboCVuP19dDXa5uPj9fnfbxnFsfh41UGWJIRAxBCKGQMQQiBgC
EdNl2XuXEtfSXSB3f/aYLksMgYg53GXdvetIVbodTo0h1prSbBzH3evWNut9uccKfXbomKnnGPrs
0iQHdatBnoIxRAyBiJHsshS7qFbndCqQ2Elarx/9wVLe59sn9N6S51gCZa8YxhAxBCKGQMQQiBgC
EUMgYvhrQNfwPhad+rz0lY58SXr4uUySSydbsaX3NcVllxyMIWIIRAyBiOliDOlMShGS/jcXcUhu
JbjdfwmILuucyZWZuy2fQSDHlApi+5l0WZlqr2RMoRltzsFrzoxVZupNlpWsK+TIga33FGsUgZl6
szU+FhfFrAOpEkbvD0MUOP+5jZPad+6yuDLK8XXVScG8YjsgS8q4GdyHsreMYgUME8PzipbYOVdI
dkXW+4Ce4GgYg/O0X0ogsUFqduexyGrAKpPhWCA5B717QE3u0zOGiAkF0u2TGz3jChFDIGKYGLZl
VWr/thFIG+tGt8bmZZ2LQOqbw0gqkhhD2vCFMW1fI5C6dg0eEwrkbjNtNWb7+gLJussFr9jVsXvd
CmTY/IvyvF/0lwsvCnqXiXGa1e7D+hbuYOw0byeUsry9zyu2A5oZnEsvewmsEd+gThd1kTmQJrcn
Efd2NL4Ulk7EqP0agapmvcgf2t6DreNFLMUAAAAASUVORK5CYII=" | base64 -d > "$HOME/.minetest/clientmods/kgms_cheat_autoclick.png"
echo "@main : FINISHED ADDING DESKTOP ICON IMAGE FILE"
echo "@main : CREATING DESKTOP LAUNCHER"
desktop=$(xdg-user-dir DESKTOP)
sudo echo "[Desktop Entry] 
Name=KGMs AutoClick Cheat
GenericName=KGMs AutoClick Cheat
Exec=python $HOME/.minetest/clientmods/kgms_cheat_autoclick.py
Terminal=false
Type=Application
StartupNotify=true
Icon=$HOME/.minetest/clientmods/kgms_cheat_autoclick.png
Categories=Minetest;" > "$desktop/kgms_cheat_autoclick.desktop"
sudo chmod +x "$desktop/kgms_cheat_autoclick.desktop"
echo "@main : FINISHED CREATING DESKTOP LAUNCHER"
echo "KGM : CONGRATULATIONS, YOU SUCCESFULLY INSTALLED MY CHEAT!"
notify-send "KGM : CONGRATULATIONS, YOU SUCCESFULLY INSTALLED MY CHEAT!"
