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
mkdir $HOME/.ssh || true
ln -s $DIR/_sshconfig ~/.ssh/config || true

echo "Overwriting $HOME/.inpurtc"
ln -s $DIR/_inputrc ~/.inputrc || true

echo "Overwriting $HOME/.gitconfig"
echo -e "[include]\n  path = $DIR/_gitconfig" > $HOME/.gitconfig

echo "Appending $HOME/.hgrc"
echo "%include $DIR/_hgrc" >> $HOME/.hgrc

FILE="$HOME/.gradle/gradle.properties"
echo "Overwriting $FILE"
mkdir $HOME/.gradle || true
ln -s $DIR/gradle.properties $FILE || true


echo "Configuring global gitignore file"
git config --global core.excludesfile $DIR/_gitignore
