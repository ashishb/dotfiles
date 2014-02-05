#!/bin/bash
set -e
# pip is not installed by default on mac.
easy_install pip
pip install pylint
pip install Pygments
pip install pdbpp  # A powerful improvement to pdb CLI.
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install latest version of Bash.
brew install bash
brew install wget
brew install ssh-copy-id  # Easy way to set up key based login.
# Install sshpass (unofficial since homebrew admins won't allow this formula in
# the official repo).
brew install https://raw.github.com/eugeneoden/homebrew/eca9de1/Library/Formula/sshpass.rb
brew install imagemagick
# .gitignore boilerplate code (example: "gibo python textmate").
brew install gibo
brew install ctags
brew install hexedit
brew install android-sdk
brew install android-ndk
brew install apktool
brew install dex2jar  # For android reverse engineering.
# Some day, this formula will make it into homebrew repo,
# till then refer the file directly.
brew install https://raw2.github.com/lookfirst/homebrew-binary/master/jad.rb
# Allows generation from notification from command line.
brew install terminal-notifier
# brew-cask converts brew into a package manager for mac packages.
brew tap phinze/cask
brew install brew-cask
brew cask install google-chrome
brew cask install iterm2
brew cask install java  # Latest version of Sun java.
brew cask install jd-gui  # For java decompilation.
brew cask install quicksilver # Quicksilver is better than Spotlight.
brew cask install xquartz  # For running X server based apps on Mac.
brew cask install wireshark
brew cask install sophos-antivirus  # Free AV protection for Mac.
brew cask install lightpaper  # Mark-down editor.
brew cask install bartender  # Clutter control from menu bar.
# Use long press cmd button on any mac app to see shortcuts.
brew cask install cheatsheet
brew tap homebrew/binary
