sudo apt update
sudo apt install git build-essential
sudo apt install openjdk-8-jre-headless
java -version
sudo useradd -r -m -U -d /opt/minecraft -s /bin/bash minecraft
sudo su - minecraft
mkdir -p ~/{backups,tools,server}
cd ~/tools && git clone https://github.com/Tiiffi/mcrcon.git
cd ~/tools/mcrcon
gcc -std=gnu11 -pedantic -Wall -Wextra -O2 -s -o mcrcon mcrcon.c
./mcrcon -h
wget https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar -P ~/server
cd ~/server
java -Xmx1024M -Xms512M -jar server.jar nogui
echo change to true
nano ~/server/eula.txt
echo rcon.port = 25575 rcon.password = 0 enable-rcon = true
nano ~/server/server.properties
exit
echo https://linuxize.com/post/how-to-install-minecraft-server-on-ubuntu-18-04/
sudo nano /etc/systemd/system/minecraft.service
sudo systemctl daemon-reload
sudo systemctl start minecraft
sudo systemctl status minecraft
sudo systemctl enable minecraft
sudo ufw allow 25565/tcp
sudo su - minecraft
echo https://linuxize.com/post/how-to-install-minecraft-server-on-ubuntu-18-04/
nano /opt/minecraft/tools/backup.sh
chmod +x /opt/minecraft/tools/backup.sh
crontab -e
echo 0 23 * * * /opt/minecraft/tools/backup.sh
ip addr
/opt/minecraft/tools/mcrcon/mcrcon -H 127.0.0.1 -P 25575 -p 0 -t
