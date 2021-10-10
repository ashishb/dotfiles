#!/usr/bin/env bash
set -euo pipefail

if test ${CI:-}; then
    set -x  # For better debugging
    # Source: https://discuss.circleci.com/t/brew-link-step-failing-on-python-dependency/33925/8?u=ashishb
    export HOMEBREW_NO_AUTO_UPDATE=1
fi

# Use Python 3
# Upgrade pip to the latest version
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install pylint
sudo python3 -m pip install Pygments
sudo python3 -m pip install pdbpp  # A powerful improvement to pdb CLI.

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Turn off analytics
brew analytics off

# Update homebrew recipes
brew update

# TODO(ashishb): Trying to debug a failure with python installation
# brew upgrade python

brew install ag
# A better file finder than find
brew install fd
# A better searcher for git repos since it skips over files which are listed in .gitignore
brew install rg
# I moved to ag (silver searcher)
# brew install ack  # A replacement for grep.
brew install bash # Install latest version of Bash.
brew install shellcheck  # Linter for shell scripts
# Configure the new version to be default
# Source: https://github.com/mathiasbynens/dotfiles/issues/544#issuecomment-104935642
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# This requires password and won't work on Travis CI
# Source: https://docs.travis-ci.com/user/environment-variables/#default-environment-variables
if test ! ${CI:-}; then
    chsh -s /usr/local/bin/bash
fi
# Install new version of bash completion for this
brew install bash-completion@2
# Install GNU core utilities (those that come with macOS are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
# coreutils is already installed on Travis CI. Don't fail if we fail to install this.
brew install coreutils || true
brew install bat  # Better than cat. Supports syntax highlighting.
brew install ctags
# This is useful for extracting EXIF data out of images
brew install exiftool
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Duplicate file search and removal
brew install fdupes
# .gitignore boilerplate code (example: "gibo python textmate").
brew install gibo
# For re-starting running executable on source file changes
gem install filewatcher
brew install hexedit
# Do I need this?
# brew install jsonpp
brew install imagemagick
# This is not available anymore.
# brew install lighthttpd  # Needed for running "git instaweb".
brew install nmap
brew install ssh-copy-id  # Easy way to set up key based login.
# Remove sshpass, I no longer use it.
# # Install sshpass (unofficial since homebrew admins won't allow this formula in
# # the official repo).
# brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
brew install vim  # Better than default vim.
# wget is already installed on Travis CI
brew install wget || true
brew install jq # For JSON parsing in shell
# https://stackoverflow.com/questions/11834297/how-can-i-remove-silence-from-an-mp3-programmatically
brew install sox  # To remove silence from music

# TODO(ashishb): Is this still required?
# Fix:
# https://stackoverflow.com/questions/19215590/why-cant-i-install-any-gems-on-my-mac
# brew tap raggi/ale && brew install openssl-osx-ca

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

brew tap homebrew/cask-versions  # For Java 8
# Useful macOS softwares.

# For some reason, this installation fails on Travis CI
# https://travis-ci.org/ashishb/dotfiles/jobs/648627652
if test ! ${CI:-}; then
  # Install chrome if it is not installed.
  ls /Applications/Google\ Chrome.app || brew install google-chrome
fi
# Too bulky to use, install it only when required.
# brew install adobe-reader  # Unavoidable since some pdf forms require this.
# brew install bartender  # Clutter control from menu bar.
# brew install bettertouchtool  # A tool for adding shortcuts to apps. I use Spectacle now.
# brew install cheatsheet # Use long press cmd button on any mac app to see shortcuts. I don't use this anymore.
# brew install dash # Offline documentation browser (I don't use it anymore)
brew install selfcontrol  # To block certain websites for productivity
brew install google-drive
# # For some reason, this installation fails on Travis CI: https://travis-ci.org/ashishb/dotfiles/builds/483579495
if test ! ${CI:-}; then
  # Seems like this cask does not exist anymore.
  brew install instabridge  # Wireless password manager.
fi
# Great tool but the cask has been deleted - https://github.com/JadenGeller/Helium/issues/207
# brew install jadengeller-helium  # Web browser on top of all other windows
brew install iterm2
brew install kindle  # Kindle reader
brew install macdown  # Mark-down editor
brew install music-manager  # Google music manager
brew install radiant-player  # Unofficial native app for Google Music
brew install diffmerge  # File diffing GUI
# I moved to Alfred. Alfred is better than QuickSilver.
# brew install quicksilver # Quicksilver is better than Spotlight.
brew install alfred
brew install bitbar
# brew install skype  # I don't use Skype anymore
# I prefer spectacle now.
# brew install slate   # XMonand like window manager.
brew install spectacle  # Window manager
# Cask is not working anymore. I moved to avast
# brew install sophos-anti-virus-home-edition  # Free Anti-virus protection
brew install avast-security  # Free Anti-virus protection
# Not using it anymore.
# brew install spotify  # An amazing music streaming service
brew install xquartz  # For running X server based apps
brew install wireshark
brew install zipeg ||  # A zip file reader
brew install fanny  # CPU temprature install monitor
# Even trying twice doesn't work with zipeg. So, just don't fail if zipeg fails on CI.
# https://travis-ci.org/ashishb/dotfiles/jobs/577997959
if test ! ${CI:-}; then
    echo "Failed to install zipeg on CI. Skipping over zipeg since it is a frequent problem."
    true
fi
# TODO(ashishb): Add cask for Gyazo, an app for taking and uploading screenshots.

# Battery health info. Not great but still good.
brew install coconutbattery
# Overcome Wi-Fi time restrictions - http://airpass.tiagoalves.me/
brew install airpass
# Not available anymore
# brew install battery-time-remaining
# Create a cask for http://froyosoft.com/soundbooster.php
brew install pycharm-ce
# Run GitHub actions locally
brew install nektos/tap/act
# TODO(ashishb) Create a cask for xtype - no point, I use phase express now
# http://mac.softpedia.com/get/Utilities/Presto-app4mac.shtml - a free and good text auto-expander for Mac

# Install fonts.
brew tap homebrew/cask-fonts
fonts=(
    font-source-code-pro
    font-roboto
)
echo "Installing fonts..."
brew install ${fonts[@]}

# Android tools used to need Java 8 to run.
# Source: https://github.com/microsoft/malmo/pull/817/
# brew install homebrew/cask-versions/adoptopenjdk8
# Android development and reverse engineering related installs.
brew install android-studio
brew install fastlane  # Android release from CLI
brew install pidcat  # An amazing alternative to logcat
# PNG compressor
brew install zopfli
# Not required anymore since they are part of Android Studio.
# brew install android-sdk && android update sdk --no-ui --filter 'platform-tools'
# brew install android-ndk # Not required anymore since they are part of Android Studio.
# Not required anymore, since Android uses gradle.
# brew install ant  # For building android projects.
brew install apktool  # For android reverse engineering.
brew install dex2jar  # For android reverse engineering.
brew install jadx  # Java decompiler
# brew install jad  # Java decompiler. JAD has been discontinued.
brew install jd-gui # For java decompilation.
# Android emulator is good enough now, therefore, I won't be using genymotion anymore.
# brew install virtualbox  # Needed for GenyMotion.
# brew install genymotion  # Emulator for android.
# This one seems to fail on GitHub Actions
# https://github.com/ashishb/dotfiles/runs/2258896886
brew cleanup || true
