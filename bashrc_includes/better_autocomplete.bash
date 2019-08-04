# Show auto-completion on first tab (default is second tab).
bind 'set show-all-if-ambiguous on'
# No empty command completion.
shopt -s no_empty_cmd_completion
# SSH auto-completion based on entries in known_hosts.
if [[ -e ~/.ssh/known_hosts ]]; then
  # complete -o default -W "$(cat ~/.ssh/known_hosts | sed 's/[, ].*//' | sort | uniq | grep -v '[0-9]')" ssh scp sftp
  complete -o default -W \
      "echo $(cat ~/.ssh/config | grep 'Host ' | sort | uniq | cut -d' ' -f2) \
      $(cat ~/.ssh/known_hosts  | cut -d ' ' -f1 | grep ',' | cut -d ',' -f1)" \
      ssh scp sftp
fi
# When completing cd and rmdir, only dirs should be possible option (default is
# all files on Mac).
complete -d cd rmdir
# Better completion for killall.
_killall()
{
    local cur prev
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}

    #  Get a list of processes
    #+ (the first sed evaluation
    #+ takes care of swapped out processes, the second
    #+ takes care of getting the basename of the process).
    COMPREPLY=( $( ps -u $USER -o comm  | \
        sed -e '1,1d' -e 's#[]\[]##g' -e 's#^.*/##'| \
        awk '{if ($0 ~ /^'$cur'/) print $0}' ))

    return 0
}
complete -F _killall killall

