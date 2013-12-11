set -e
# Install curl
sudo apt-get install curl
# Install dev tools.
sudo apt-get install xsel
sudo apt-get install git
sudo apt-get install whois
sudo apt-get install vim
sudo apt-get install python-dev
sudo apt-get install pylint
sudo apt-get install python-pip
sudo apt-get install nmap
sudo apt-get remove thunderbird  # I don't need thunderbird.
sudo apt-get install zip  # I am surprised, how this can be missing.
sudo apt-get install libmysqlclient-dev  # Needed for powerline.
sudo easy_install Pygments
sudo easy_install powerline
sudo easy_install pdbpp  # A powerful improvement to pdb CLI.
# Install Google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

#### Ubuntu specific settings. ####
# Via fixubuntu.com
sudo apt-get remove -y unity-lens-shopping
sudo sh -c 'echo "127.0.0.1 productsearch.ubuntu.com" >> /etc/hosts'
# Save gnome session on exit.
command -v dconf 1>/dev/null &&
 dconf write /org/gnome/gnome-session/auto-save-session true 1>/dev/null &&
# Don't sent Unity length results to Amazon.
command -v gsettings 1>/dev/null &&
 	gsettings set com.canonical.Unity.Lenses remote-content-search none
# Show date and day in the clock in Gnome.
command -v gsettings 1>/dev/null &&
	gsettings set com.canonical.indicator.datetime show-clock true &&
	gsettings set com.canonical.indicator.datetime show-day true &&
	gsettings set com.canonical.indicator.datetime show-date true
