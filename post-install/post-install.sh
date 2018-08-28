#!/bin/bash

###########################################################################
# This post installation bash script should be used on Ubuntu 18.04.1 LTS #
#                     By: Samuel Stidham 2018/08/23                       #
###########################################################################

# Set up the environment
source ~/.bashrc
source ~/.profile

# Update the software
sudo apt-get update && sudo apt-get upgrade -y

# Update the kernel, if necessary
sudo apt-get dist-upgrade -y

# Remove unnecessary kernel versions and other unused files
sudo apt-get autoremove

# Install imvirt to detect if OS running in VM
sudo apt-get install -y imvirt

# Detect whether Ubuntu is in a VM
if [[ $(imvirt) ]]; then
 sudo apt-get install -y open-vm-tools-desktop;
fi

# Install fortune-mod and cowsay for zsh plugin
sudo apt-get install -y fortune-mod cowsay

# Install CVS tools, vim, and exuberant-ctags
sudo apt-get install -y git mercurial vim exuberant-ctags

# Configure git
git config --global color.ui auto
git config --global user.name "Samuel Stidham"
git config --global user.email "dqfan2012@gmail.com"

# Install build tools and build dependencies
sudo apt-get install -y build-essential gcc cmake libgit2-dev

# Install commandline HTTP tools
sudo apt-get install -y curl httpie lynx

# Install additional shells
sudo apt-get install -y zsh fish csh ksh

# Install additional terminal emulators
sudo apt-get install -y terminator guake tilix

# Set the default shell to zsh - restart needed to make changes take effect
chsh -s /usr/bin/zsh

################
# Rust Install #
################

# Install Rust build tools
curl https://sh.rustup.rs -sSf | sh

# fix permissions for rust
sudo chown -R sstidham:sstidham ~/.cargo

# Make sure the Rust environment gets initialized
source ~/.profile

# Install exa the ls replacement
cargo install exa

##################
# Python Install #
##################

# Python and Python 3 automatically come installed on Ubuntu, but not pip. Install pip
sudo apt-get install -y python3-pip python-pip

################
# Node Install #
################

# Install nvm - Update this as NVM is updated
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Install node lts and current
nvm install 8.11.4
nvm install 10.9.0

# Select default node version
nvm use 8.11.4

################
# Ruby Install #
################

# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

# Install the newest version of ruby
rbenv install 2.5.1

##############
# DB Install #
##############

# Install MySQL 5.7
sudo apt-get install -y mysql-server mysql-client

# Configure MySQL
sudo mysql_secure_installation

# Install PostgreSQL 10
sudo snap install postgresql10

# Install sqlite3 and sqlitebrowser
sudo apt-get install -y sqlite3 sqlitebrowser

# Install datagrip. DbVisualizer can be used as an alternative
sudo snap install datagrip

###############
# PHP Install #
###############

# Install PHP
sudo apt-get install -y php7.2-bcmath php7.2-cli php7.2-common php7.2-curl php7.2-gd php7.2-json php7.2-mbstring php7.2-mysql php7.2-opcache php7.2-pgsql php7.2-recode php7.2-sqlite3 php7.2-readline php7.2-tidy php7.2-xml php7.2-xmlrpc php7.2-xsl php7.2-zip

# Install Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"

# fix permissions for composer
sudo chown -R sstidham:sstidham /home/sstidham/.composer

# Install valet-linux dependencies
sudo apt-get install -y libnss3-tools jq xsel

# Download valet
composer global require cpriego/valet-linux

# Install valet
valet install

# Configure place for valet sites
mkdir -p ~/Code/valet-sites
cd ~/Code/valet-sites
valet park

# Change back to home directory
cd ~

######################
# Social Environment #
######################

# Install Slack
sudo snap install slack --classic

# Install Discord
sudo snap install discord

# Install Gitter
sudo snap install gitter-desktop

# Mailspring E-mail Client
sudo snap install mailspring

############
# Graphics #
############

# Install the GIMP
sudo snap install gimp

# Install Vectr
sudo snap install vectr

# Install Inkscape
sudo snap install inkscape

# Install Blender
sudo snap install blender

###################
# Kotlin Language #
###################

sudo snap install kotlin --classic

#######################
# Code Editors & IDEs #
#######################

# Install Visual Studio Code
sudo snap install vscode --classic

# Install Sublime Text 3
sudo snap install sublime-text --classic

# Install Atom
sudo snap install atom --classic

# Install Android Studio
sudo snap install android-studio --classic

###################
# Other Dev Tools #
###################

# Install Postman API Dev Environment
sudo snap install postman

# Install Insomnia REST Client
sudo snap install insomnia

###################
# Browser Plugins #
###################

# Install Flash and Java 8
sudo apt-get install -y flashplugin-installer openjdk-8-jdk

# Install the fonts
sudo sh ~/.dotfiles/nerd-fonts/install.sh

# Reboot the system for all the changes to take affect
sudo reboot
