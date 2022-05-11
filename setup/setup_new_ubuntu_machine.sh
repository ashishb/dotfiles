#!/usr/bin/env bash
set -e

sudo apt-get update
# Install dev tools
# libxss1 is required for Google-chrome
# On Linux, bat is installed as batcat
sudo apt-get -y install ant \
  curl \
  git \
  libxss1 \
  nmap \
  ssh \
  vim \
  whois \
  xsel \
  zip \
  tmux \
  bat \
  fd-find \
  ripgrep \
  golang-go

# Install Python 3.9
sudo add-apt-repository -y ppa:deadsnakes/ppa && sudo apt -y install python3.9 python3-pip

# For some reason, this fails now
# We don't need Java 8 on Linux right now anyways as I don't use Linux for
# Android development
# http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html
# sudo apt-get -y install oracle-java8-installer  # Required for android.

sudo apt-get -y remove thunderbird  # I don't need thunderbird.
sudo pip install --upgrade pip
# Use pip instead of easy_install.
# http://stackoverflow.com/questions/3220404/why-use-pip-over-easy-install
sudo pip install pylint
sudo pip install Pygments
sudo pip install pdbpp  # A powerful improvement to pdb CLI.
sudo apt-get install google-chrome-stable

#### Ubuntu specific settings. ####
# Via fixubuntu.com
sudo apt-get remove -y unity-lens-shopping
sudo sh -c 'echo "127.0.0.1 productsearch.ubuntu.com" >> /etc/hosts'
## Save gnome session on exit.
#command -v dconf 1>/dev/null &&
# dconf write /org/gnome/gnome-session/auto-save-session true 1>/dev/null &&
## Don't sent Unity length results to Amazon.
#command -v gsettings 1>/dev/null &&
# 	gsettings set com.canonical.Unity.Lenses remote-content-search none
