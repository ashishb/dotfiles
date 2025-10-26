#!/usr/bin/env bash
# Several custom aliases to improve productivity.
# force X11 tunneling through ssh
alias ssh='ssh -Y'
# Some more aliases.
alias ..='cd ..'
# Pretty printed python,html,css etc. code.
alias cat=bat
alias d="du -h -d=1"
alias df="df -h"
alias grep='GREP_COLOR="1;37;45" LANG=C grep --color=auto'
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias publicip="curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g'"
alias localip="ipconfig getifaddr en0"
# List all make targets.
alias make_list="make -qp | sed -n -e 's/^\([^.#[:space:]][^:[:space:]]*\): .*/\1/p'"
alias jq_non_empty="jq 'del(..|select(. == null))' | jq 'del(..|select(. == 0))' | jq 'del(..|select(. == \"\"))'"
# --net=host is to map all web service from docker image to host image
alias npm='docker run --rm -it -v ${PWD}:${PWD} --net=host --workdir=${PWD} node:25-bookworm-slim npm'
alias npx='docker run --rm -v ${PWD}:${PWD} --net=host --workdir=${PWD} node:25-bookworm-slim npx'

alias htmlhint="npx htmlhint"

# Ref: https://serverfault.com/a/1123925/1053189
alias delete_unused_cloud_run="gcloud run revisions list --filter=\"status.conditions.type:Active AND status.conditions.status:'False'\" --format='value(metadata.name)' | xargs -r -L1 gcloud run revisions delete --quiet"

# Usage: kotin_run foo.kt <args-list> to compile foo.kt into foo.kt.jar and run it with the optional <args-list>
ktr () { kotlinc "$1" -include-runtime -d "$1".jar && java -jar "$1".jar "${@:2}"; }

# Usage: ghurl <filename>, will open the file on github.com. Respects branch name and repo name.
# Filename can contain a fragment like "#L11" to highlight line 11 or "L22-L34" to hightlight from
# line 22 to line 34.
function ghurl()
{
  domain='https://github.com' &&
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

function stargazer()
{
  domain='https://starcharts.herokuapp.com/' &&
  # Get the repo name and remove ".git" from the end
  repo=$(git config --get remote.origin.url | cut -d: -f2 | rev | cut -d. -f2- | rev) &&
  url=${domain}/${repo}
  open "${url}"
}

# Usage: ghpr <pr number>, will open the pull request on github.com. Respects repo name.
# GitHub uses a single counter for pull requests and issues, so, even an issue can open via this mechanism.
function ghpr()
{
  domain='https://github.com' &&
  # Get the repo name and remove ".git" from the end
  repo=$(git config --get remote.origin.url | cut -d: -f2 | rev | cut -d. -f2- | rev) &&
  url=${domain}/${repo}/pull/${1} &&
  # echo url is ${url} &&
  open "${url}"
}

# Mac OS only
function restart_bluetooth()
{
  # Source: https://gist.github.com/nicolasembleton/afc19940da26716f8e90
  sudo kextunload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
  sudo kextload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
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
    sudo gem update --system; sudo gem update'
  # Set the iTerm tab title to current dir.
  export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
fi

# Resize and shrink photos before uploading them to my website
function resize_for_website {
  full_filename="$1"
  filename=$(basename -- "$full_filename")
  extension="${filename##*.}"
  filename_no_extension="${filename%.*}"
  resized_file_name="${filename_no_extension}_resized.${extension}"
  magick "${full_filename}" -resize 1500x1500 "$resized_file_name"
  echo "Resized ${filename} to ${resized_file_name}"
  du -shc "${filename}" "${resized_file_name}"
}
export -f resize_for_website

# https://stackoverflow.com/a/73108928
function dockersize {
  docker manifest inspect -v "$1" | jq -c 'if type == "array" then .[] else . end | select(.Descriptor.platform.architecture != "unknown")' |  jq -r '[ ( .Descriptor.platform | [ .os, .architecture, .variant, ."os.version" ] | del(..|nulls) | join("/") ), ( [ ( .OCIManifest // .SchemaV2Manifest ).layers[].size ] | add ) ] | join(" ")' | numfmt --to iec --format '%.2f' --field 2 | sort | column -t ;
}

