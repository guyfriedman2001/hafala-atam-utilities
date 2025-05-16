
#1) Install prerequisites (software required for the next steps):
sudo sed -i "s/# deb-src/deb-src/g" /etc/apt/sources.list
sudo apt update -y
sudo apt install -y build-essential libncurses-dev bison flex
sudo apt install -y libssl-dev libelf-dev

#2) Download the Linux source code:
cd ~
apt source linux

#3) Change permissions and rename the directory:
sudo chown -R student:student ~/linux-4.15.0/
mv ~/linux-4.15.0 ~/linux-4.15.18-custom

#4) Configure the kernel build process (starting from an existing configuration file):
cd ~/linux-4.15.18-custom
cp -f /boot/config-$(uname -r) .config
geany .config # you may use any text editor you like

