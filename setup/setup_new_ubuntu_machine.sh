set -e

# For Oracle/ Sun JDK 6.
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
# Install dev tools.
sudo apt-get -y install ant
sudo apt-get -y install curl
sudo apt-get -y install git
sudo apt-get -y install libxss1  # Needed by Google-chrome.
sudo apt-get -y install nmap
sudo apt-get install oracle-java6-installer  # Needed for android.
sudo apt-get -y install python-dev
sudo apt-get -y install python-pip
sudo apt-get -y install ssh
sudo apt-get -y install vim
sudo apt-get -y install whois
sudo apt-get -y install xsel
sudo apt-get -y install zip  # I am surprised, how this can be missing.
sudo apt-get -y remove thunderbird  # I don't need thunderbird.
# Use pip instead of easy_install.
# http://stackoverflow.com/questions/3220404/why-use-pip-over-easy-install
sudo pip install pylint
sudo pip install Pygments
sudo pip install pdbpp  # A powerful improvement to pdb CLI.
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
