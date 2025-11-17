#!/usr/bin/env bash
set -euo pipefail

if test ${CI:-}; then
    set -x  # For better debugging
    # Source: https://discuss.circleci.com/t/brew-link-step-failing-on-python-dependency/33925/8?u=ashishb
    export HOMEBREW_NO_AUTO_UPDATE=1
fi

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ashishb/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Turn off analytics
brew analytics off

# Update homebrew recipes
brew update

# Install it early on as other packages might depend on it and might install
# a different version of Python otherwise
brew install python@3.12
# Poetry package manager
brew install poetry

brew install rust
# Find unused poetry packages (warning: this does return false positives!)
cargo install poetry-udeps --locked

# A better searcher for git repos since it skips over files which are listed in .gitignore
brew install rg
# rg is much better
# brew install ag
# A better file finder than find
# I moved to ag (silver searcher)
# brew install ack  # A replacement for grep.

# Better than find
brew install fd
brew install bash # Install latest version of Bash.
brew install shellcheck  # Linter for shell scripts
# Install new version of bash completion for this
brew install bash-completion@2
# Install GNU core utilities (those that come with macOS are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
# coreutils is already installed on Travis CI. Don't fail if we fail to install this.
brew install coreutils
brew install mmv # Move multiple files
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
brew install google-cloud-sdk

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
# Great tool but the cask has been deleted - https://github.com/JadenGeller/Helium/issues/207
# brew install jadengeller-helium  # Web browser on top of all other windows
brew install iterm2
brew install starship  # Awesome prompt configuration tool (see scripts/starship.toml as well)
# Kindle cask has been discontinued
# Ref: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/k/kindle.rb
# brew install kindle  # Kindle reader
brew install macdown  # Mark-down editor
brew install diffmerge  # File diffing GUI
# I moved to Alfred. Alfred is better than QuickSilver.
# brew install quicksilver # Quicksilver is better than Spotlight.
brew install alfred
brew install bitbar
# brew install skype  # I don't use Skype anymore
# I prefer spectacle now.
# brew install slate   # XMonand like window manager.
# Spectable is no longer maintained, switch to rectangle
# brew install spectacle  # Window manager
brew install rectangle
# Cask is not working anymore. I moved to avast
# brew install sophos-anti-virus-home-edition  # Free Anti-virus protection
# Seems to fail on GitHub CI
if test ! ${CI:-}; then
  brew install avast-security  # Free Anti-virus protection
fi
# Not using it anymore.
# brew install spotify  # An amazing music streaming service
brew install xquartz  # For running X server based apps
brew install wireshark
brew install fanny
# TODO(ashishb): Add cask for Gyazo, an app for taking and uploading screenshots.

# Battery health info. Not great but still good.
brew install coconutbattery
# Overcome Wi-Fi time restrictions - http://airpass.tiagoalves.me/
brew install airpass
# Not available anymore
# brew install battery-time-remaining
# Create a cask for http://froyosoft.com/soundbooster.php
brew install pycharm-ce
# Go language - this fails on CI
# https://github.com/ashishb/dotfiles/runs/6838155133?check_suite_focus=true
if test ! ${CI:-}; then
  brew install golang
  # This unlinks the existing Go 1.17 and fails on CI
  brew install golangci-lint
fi
brew install goland
# go get -u golang.org/x/lint/golint  # Install go lint
# Install docker
brew install homebrew/cask/docker
# Docker file linter
brew install hadolint
# YAML file linter
brew install yamllint
# GPG for signing git commits
# https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key
brew install gpg
# GitHub Command-line tool
brew install gh
# GitHub CLI Copilot Extension
# This cannot be auto installed without `gh login` first
# gh extension install github/gh-copilot

# Nice diff for git - https://github.com/dandavison/delta
brew install git-delta
# Run GitHub actions locally
brew install act
# TODO(ashishb) Create a cask for xtype - no point, I use phase express now
# http://mac.softpedia.com/get/Utilities/Presto-app4mac.shtml - a free and good text auto-expander for Mac

# Install fonts.
echo "Installing fonts..."
brew install --cask font-fira-code

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

# Bluetooth CLI for mac
# brew install blueutil  # Useless for now
# FOSS text-expander for Mac OS
brew tap espanso/espanso
brew install espanso
# Productivity note-taking app in Markdown
brew install obsidian
# Mac menubar app for meeting
brew install meetingbar
# Media Player for Mac
brew install vlc
# Useful ruler for Mac screen measurements
brew install free-ruler
# Javascript package management
# brew install yarn  # I have shifted to dockerized `yarn` for safety for now
brew install harper  # FOSS Grammarly alternative

# This one seems to fail on GitHub Actions
# https://github.com/ashishb/dotfiles/runs/2258896886
# brew cleanup || true

# Configure the new version to be default
# Source: https://github.com/mathiasbynens/dotfiles/issues/544#issuecomment-104935642
sudo bash -c 'echo /bin/bash >> /etc/shells'
# This requires password and won't work on Travis CI
# Source: https://docs.travis-ci.com/user/environment-variables/#default-environment-variables
if test ! ${CI:-}; then
  chsh -s /bin/bash
fi

# For re-starting running executable on source file changes
sudo gem install filewatcher
sudo gem install mdl
