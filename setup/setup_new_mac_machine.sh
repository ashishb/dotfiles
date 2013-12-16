set -e
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
brew install wget
brew install imagemagick
# .gitignore boilerplate code (example: "gibo python textmate").
brew install gibo
brew install ctags
# brew-cask converts brew into a package manager for mac packages.
brew install brew-cask
brew cask install google-chrom
brew cask install xqartz  # For running X server based apps on Mac.
brew cask install wireshark
