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

# Tree
if [ ! -x "$(which tree 2>/dev/null)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi
# Mac style pbcopy and pbpaste on linux.
command -v xsel 1>/dev/null &&
  alias pbcopy='xsel --clipboard --input' &&
  alias pbpaste='xsel --clipboard --output'

# Mac-specific settings.
if [[ `uname -s` == "Darwin" ]]; then
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

