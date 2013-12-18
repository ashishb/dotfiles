set -e
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install latest version of Bash.
brew install bash
brew install wget
brew install imagemagick
# .gitignore boilerplate code (example: "gibo python textmate").
brew install gibo
brew install ctags
brew install hexedit
# Allows generation from notification from command line.
brew install terminal-notifier
# brew-cask converts brew into a package manager for mac packages.
brew install brew-cask
brew cask install google-chrome
brew cask install xquartz  # For running X server based apps on Mac.
brew cask install wireshark
