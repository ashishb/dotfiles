#!/usr/bin/env bash
# Several custom aliases to improve productivity.
# force X11 tunneling through ssh
alias ssh='ssh -Y'
# Some more aliases.
alias ..='cd ..'
# Pretty printed python,html,css etc. code.
alias c="pygmentize -O style=monokai -f console256 -g"
alias d="du -h -d=1"
alias df="df -h"
alias grep='GREP_COLOR="1;37;45" LANG=C grep --color=auto'
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias publicip="curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g'"
alias localip="ipconfig getifaddr en0"
# List all make targets.
alias make_list="make -qp | sed -n -e 's/^\([^.#[:space:]][^:[:space:]]*\): .*/\1/p'"

# Usage: kotin_run foo.kt <args-list> to compile foo.kt into foo.kt.jar and run it with the optional <args-list>
ktr () { kotlinc "$1" -include-runtime -d "$1".jar && java -jar "$1".jar "${@:2}"; }

# Usage: ghurl <filename>, will open the file on github.com. Respects branch name and repo name.
# Filename can contain a fragment like "#L11" to highlight line 11 or "L22-L34" to hightlight from
# line 22 to line 34.
function ghurl()
{
  domain='http://github.com' &&
  # Get the repo name and remove ".git" from the end
  repo=$(git config --get remote.origin.url | cut -d: -f2 | rev | cut -d. -f2- | rev) &&
  # Fallback to master branch
  remoteBranch=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null || echo 'master') &&
  # Remove origin prefix
  remoteBranch=${remoteBranch#origin/} &&
  currentDir=$PWD &&
  gitTopLevel=$(git rev-parse --show-toplevel) &&
  # Remove git base directory from the path.
  pathRelativeToBaseRepo=${currentDir#${gitTopLevel}}/${1} &&
  # echo Remote branch is ${remoteBranch} &&
  # echo current Dir is ${currentDir} &&
  # echo gitTopLevel is ${gitTopLevel} &&
  # echo pathRelativeToBaseRepo is ${pathRelativeToBaseRepo}
  url=${domain}/${repo}/tree/${remoteBranch}/${pathRelativeToBaseRepo} &&
  # echo url is ${url} &&
  open "${url}"
}

alias myghpr="gh pr --me --link"
alias myghissues="open https://github.com/issues/assigned"

# Tree
if [ ! -x "$(command -v tree 2>/dev/null)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi
# Mac style pbcopy and pbpaste on linux.
command -v xsel 1>/dev/null &&
  alias pbcopy='xsel --clipboard --input' &&
  alias pbpaste='xsel --clipboard --output'

# Mac-specific settings.
if [[ $(uname -s) == "Darwin" ]]; then
  # Lock the screen (when going away from keyboard)
  alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
  # Update everything.
  alias update='sudo softwareupdate -i -a; brew update;
    brew upgrade; brew cleanup;
    sudo npm update npm -g; sudo npm update -g;
    sudo gem update --system; sudo gem update'
  # Set the iTerm tab title to current dir.
  export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
fi

