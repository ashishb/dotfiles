## Bash History customizations.
# Avoid duplicates.
export HISTCONTROL=ignoredups:erasedups
# Append (not ovewrite) history entries.
shopt -s histappend
# Larger bash history (default is 500)
export HISTFILESIZE=10000
export HISTSIZE=10000
