# 2IdiotsServer

Dedicated server for 2idiots client project

### For the ip adress and password to our dedicated vps we use contact the CPO or CTO

## How to run

### Locally
You can run this project locally by opening it in your godot game engine and running the project as you normally would.
The project does not have any visuals but you can see in the output console wether it is running or if players connected.

### Online
You can run this project online on an VPS so other player not in your local network can connect to it.

First you need to export the project and send it to your vps:
1. Export the project for linux
2. Transfer the file with ```scp [path/file.pck] [username]@[ip-adress or domain name]:[folder]/[file_name.pck] (i.e. scp D:\godot_projects\2idiots-export\2IdiotsServer.pck root@123.12.12.123:2idiots/Server.pck)```


Here is how to run it on a Linux Ubuntu VPS:

1. Download Putty and connect to the vps.

2. Download linux server godot distribution on your linux vps by using the command ```wget https://downloads.tuxfamily.org/godotengine/3.5/Godot_v3.5-stable_linux_server.64.zip``` your version might be different depending on the time you are reading this.

3. Unzip it by using ```unzip [zip-name] (i.e. unzip Godot_v3.5-stable_linux_server.64.zip)```

4. Run the project pck by using ```[godot-dist-here] --main-pack [File-name].pck (i.e. ./Godot_v3.5-stable_linux_server.64 --main-pack Server.pck)```
