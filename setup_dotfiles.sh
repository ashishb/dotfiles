#!/usr/bin/env bash
set -euo pipefail

# Works on both Mac and GNU/Linux.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Generates colored output.
function special_echo {
  echo -e '\E[0;32m'"$1\033[0m"
}

function error_echo {
  echo -e '\E[0;31m'"$1\033[0m"
}

# This detection only works for mac and linux.
if [ "$(uname)" == "Darwin" ]; then
  special_echo "Setting up $HOME/.bashrc"
  echo "source $DIR/_bashrc" >> $HOME/.bash_profile
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  special_echo "Seeting up $HOME/.bash_profile"
  echo "source $DIR/_bashrc" >> $HOME/.bashrc
fi

special_echo "Overwriting $HOME/.vim"
echo "source $DIR/_vimrc" > $HOME/.vimrc

# Not working.
echo "Setting $HOME/.vim to link to $DIR/_vim directory"
ln -s $DIR/_vim $HOME/.vim || true

echo "Overwriting $HOME/.screenrc"
echo "source $DIR/_screenrc" > $HOME/.screenrc

echo "Overwriting $HOME/.ssh/config"
touch $DIR/_sshconfig
mkdir -p $HOME/.ssh
echo "Include $DIR/_sshconfig" >> ~/.ssh/config

FILE="$HOME/.inputrc"
echo "Overwriting $FILE"
# https://unix.stackexchange.com/a/179294
echo "\$include $DIR/_inputrc" >> $FILE

# Disable last two lines which replace https with ssh since it cause Travis CI failures :(
# This is hacky.
if test "${CI:-}"; then
  tac $DIR/_gitconfig | tail -n +3 | tac > $DIR/_gitconfig
fi
echo "Including new config file in $HOME/.gitconfig"
echo -e "[include]\n  path = $DIR/_gitconfig" > $HOME/.gitconfig
# Disable hgrc, I haven't use mercurial in a long while
# echo "Appending $HOME/.hgrc"
# echo "%include $DIR/_hgrc" >> $HOME/.hgrc

FILE="$HOME/.gradle/gradle.properties"
echo "Overwriting $FILE"
mkdir -p $HOME/.gradle
ln -s $DIR/gradle.properties $FILE || true

FILE="$HOME/.config/starship.toml"
echo "Overwriting $FILE"
mkdir -p ~/.config
ln -s $DIR/scripts/starship.toml $FILE


echo "Configuring global gitignore file"
git config --global core.excludesfile $DIR/_gitignore
