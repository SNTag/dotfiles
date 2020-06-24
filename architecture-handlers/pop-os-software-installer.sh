#!/usr/bin/env bash
# Designed for Pop OS
# This script will (hopefully) handle most of my system expectations.
# I tend to swap systems regularly, this script is meant as a helper script.
# It will most likely develop outdated components.

sudo apt update
sudo apt upgrade

### improved power managment
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get updatesudo apt-get install tlp tlp-rdwsudo tlp start

### install all media codecs
sudo apt-get install ubuntu-restricted-extras -y

### gnome tools
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool

### programming languages
### latex
sudo apt install texlive-full -y

### R
sudo apt install libcurl4-openssl-dev libssl-dev -y  # pre-requisites
sudo apt -y install r-base -y 		       # installs R itself
Rscript ~/.dotfiles/code/r/installation-setup.r -y

### python3
sudo apt install python3-pip -y
sudo apt install python3-doc -y

### julia
sudo apt install julia -y
sudo apt install julia-doc -y

### for some network mapping features
sudo apt install nmap -y

### pandoc
sudo apt install pandoc -y
sudo apt install pandoc-citeproc -y
#### MISSING CROSSREF?!

### emacs
sudo apt install emacs -y

### photo editing
sudo apt install darktable -y
sudo apt install rawtherapee -y

### wine
sudo apt install wine -y
sudo apt install mono-complete -y

### disk managment
sudo apt install gparted

### terminal ricing
sudo apt install neofetch -y

sudo apt install autoconf -y
sudo apt install automake -y
sudo apt install g++ -y
sudo apt install gcc -y
sudo apt install libpng-dev -y
sudo apt install libpoppler-dev -y
sudo apt install libpoppler-glib-dev -y
sudo apt install libpoppler-private-dev -y
sudo apt install libz-dev -y
sudo apt install make -y
sudo apt install pkg-config -y

### drop-down terminal
sudo apt install guake -y

### syncthing
# Add the release PGP keys:
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -

# Add the "stable" channel to your APT sources:
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

# Update and install syncthing:
sudo apt update -y
sudo apt install syncthing -y



### fonts
#rm ~/.local/share/fonts/
unzip ../fonts/* -d ~/.local/share/fonts/

### pibakery
sudo apt-get install kpartx
sudo apt install npm

git clone https://github.com/davidferguson/pibakery.git ~/bin/pibakery
cd ~/bin/pibakery
npm install
npm start

### tweaks
## fstrim
sudo systemctl enable fstrim.timer

### backups
sudo apt-add-repository -y ppa:teejee2008/ppa
sudo apt-get update
sudo apt-get install timeshift