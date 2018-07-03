#!/bin/bash
set -e
# pip is not installed by default on mac.
sudo easy_install pip
sudo pip install pylint
sudo pip install Pygments
sudo pip install pdbpp  # A powerful improvement to pdb CLI.

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
# Update homebrew recipes
brew update
brew install ack  # A replacement for grep.
brew install bash # Install latest version of Bash.
brew install bash-completion
# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
brew install ctags
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# .gitignore boilerplate code (example: "gibo python textmate").
brew install gibo
brew install hexedit
brew install imagemagick
# This is not available anymore.
# brew install lighthttpd  # Needed for running "git instaweb".
brew install nmap
brew install ssh-copy-id  # Easy way to set up key based login.
# Install sshpass (unofficial since homebrew admins won't allow this formula in
# the official repo).
brew install https://raw.github.com/eugeneoden/homebrew/eca9de1/Library/Formula/sshpass.rb
brew install vim  # Better than default vim.
brew install wget
# Fix:
# https://stackoverflow.com/questions/19215590/why-cant-i-install-any-gems-on-my-mac
brew tap raggi/ale && brew install openssl-osx-ca
# Allows generation from notification from command line (not that useful).
# brew install terminal-notifier

# This is not required anymore as per https://github.com/Homebrew/homebrew-core/issues/131
# brew-cask converts brew into a package manager for mac packages.
# brew install caskroom/cask/brew-cask

# Deprecated since all formulae has been migrated
# brew tap homebrew/binary

# Deprecated since all formulae has been migrated
# Unstable softwares, right from HEAD of some other repo.
# brew tap brew homebrew/homebrew-head-only

# Useful OS X softwares.
brew cask install google-chrome 
# Too bulky to use, install it only when required.
# brew cask install adobe-reader  # Unavoidable since some pdf forms require this.
# brew cask install bartender  # Clutter control from menu bar.
# brew cask install bettertouchtool  # A tool for adding shortcuts to apps. I use Spectacle now.
# brew cask install cheatsheet # Use long press cmd button on any mac app to see shortcuts. I don't use this anymore.
# brew cask install dash # Offline documentation browser (I don't use it anymore)
brew cask install google-backup-and-sync  # New name for Google Drive
brew cask install jadengeller-helium  # Web browser on top of all other windows
brew cask install instabridge  # Wireless password manager.
brew cask install caskroom/cask/iterm2 
brew cask install iterm2
brew cask install java  # Latest version of Sun java.
brew cask install kindle  # Kindle reader
brew cask install macdown  # Mark-down editor
brew cask install music-manager  # Google music manager
brew cask install radiant-player  # Unofficial native app for Google Music
# I moved to Alfred. Alfred is better than QuickSilver.
# brew cask install quicksilver # Quicksilver is better than Spotlight. 
brew cask install alfred
brew cask install skype
# I prefer spectacle now.
# brew cask install slate   # XMonand like window manager. 
brew cask install spectacle  # Window manager
# Cask is not working anymore. I moved to avast
# brew cask install sophos-anti-virus-home-edition  # Free Anti-virus protection
brew cask install avast-security  # Free Anti-virus protection
brew cask install spotify  # An amazing music streaming service
brew cask install xquartz  # For running X server based apps
brew cask install wireshark
brew cask install zipeg  # A zip file reader
# TODO(ashishb): Add cask for Gyazo, an app for taking and uploading screenshots.

brew cask install battery-time-remaining
# Create a cask for http://froyosoft.com/soundbooster.php
brew cask install pycharm-ce
# TODO(ashishb) Create a cask for xtype
# http://mac.softpedia.com/get/Utilities/Presto-app4mac.shtml - a free and good text auto-expander for Mac

# Install fonts.
brew tap caskroom/fonts
fonts=(
    font-source-code-pro
    font-roboto
)
echo "Installing fonts..."
brew cask install ${fonts[@]}

# Android development and reverse engineering related installs.
brew cask install android-studio
brew install pidcat  # An amazing alternative to logcat
# Not required anymore since they are part of Android Studio.
# brew cask install android-sdk && android update sdk --no-ui --filter 'platform-tools' 
# brew cask install android-ndk # Not required anymore since they are part of Android Studio.
# Not required anymore, since Android uses gradle.
# brew install ant  # For building android projects.
brew install apktool  # For android reverse engineering.
brew install dex2jar  # For android reverse engineering.
# Some day, this formula will make it into homebrew repo,
# till then refer the file directly.
brew install https://raw2.github.com/lookfirst/homebrew-binary/master/jad.rb  # For java decompilation.
brew install caskroom/cask/jd-gui # For java decompilation.
# Android emulator is good enough now, therefore, I won't be using genymotion anymore.
# brew cask install virtualbox  # Needed for GenyMotion.
# brew cask install genymotion  # Emulator for android.
brew cleanup
