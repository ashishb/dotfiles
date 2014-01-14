# auto completion for the p4 (Perforce) command.
# by torstein.k.johansen@gmail.com

cache_dir=$HOME/.p4.d
if [ ! -e $cache_dir ]; then
    mkdir $cache_dir
fi

p4_branches_cache_file=$cache_dir/branches.cache
p4_users_cache_file=$cache_dir/users.cache
p4_commands_cache_file=$cache_dir/commands.cache

function get_branches()
{
    if [ ! -r $p4_branches_cache_file ]; then
        p4 branches | awk 'NF>3 {print $2}'> $p4_branches_cache_file
    fi

    echo $(cat $p4_branches_cache_file)
}

function get_users()
{
    if [ ! -r $p4_users_cache_file ]; then
        p4 users | awk 'NF>3 {print $1}' > $p4_users_cache_file
    fi

    echo $(cat $p4_users_cache_file)
}

function get_commands()
{
    if [ ! -r $p4_commands_cache_file ]; then
        p4 help commands | awk 'NF>3 {print $1}' > $p4_commands_cache_file
    fi

    echo $(cat $p4_commands_cache_file)
}

function get_depot_completion()
{
    echo $(
        # in case someone actually has /[/]depot/ on their file system
        # and have enabled globastar, we disable it here just to be
        # safe.
        shopt -u globstar
        completions=$(p4 files ${1}* 2>/dev/null)
        completions=${completions}" "$(p4 dirs ${1}* 2>/dev/null)
        echo $completions
    )
}

_p4_commands()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    local prev=${COMP_WORDS[COMP_CWORD-1]}

    commands="$(get_commands) ... //depot"

    # default completions is the list of commands
    completions=$commands

    case "$prev" in
        add)
            completions="-c -f -n -t"
            ;;
        annotate)
            completions="-a -c -i -q -d -dw"
            ;;
        branch)
            completions="-f -d -o -i $(get_branches)"
            ;;
        change)
            completions="-f -s -d -o -i"
            ;;
        changes)
            completions="-i -t -l -L -c -m -s -u"
            ;;
        changelist)
            completions="-f -s -d -o -i"
            ;;
        changelists)
            completions="-i -t -l -L -c -m -s -u"
            ;;
        client)
            completions="-f -t -d -o -i"
            ;;
        counter)
            completions="-f -d"
            ;;
        delete)
            completions="-c -n"
            ;;
        depot)
            completions="-d -o -i"
            ;;
        describe)
            completions="-dn -dc -ds -du -db -dw -s"
            ;;
        diff)
            completions="... -dn -dc -ds -du -db -dw -dl -f -sa -sd -se -sr -t"
            ;;
        edit)
            completions="-c -n -t"
            ;;
        integrate)
            completions="-c -d -Dt -Ds -Di -f -h -i -I -o -r -t -v -b -s -n"
            ;;
        resolve)
            completions="-af -am -as -at -ay -db -dw -f -n -o -t -v"
            ;;
        resolved)
            completions="-o"
            ;;
        revert)
            completions="-a -n -k -c ..."
            ;;
        sync)
            completions="-f -n -k"
            ;;
        -s)
            completions="@"
            ;;
        -t)
            # file types
            base_types="text binary symlink apple apple resource unicode utf16"
            modifiers="w x ko k l C D F S Sn m X"
            completions=""
            for el in $base_types; do
                for ele in $modifiers; do
                    completions=$completions" "${el}"+"${ele}
                done
            done
            
            ;;
        -b)
            completions=$(get_branches)
            ;;
        changes)
            completions="... -u"
            ;;
        -u)
            completions=$(get_users)
            ;;
        user)
            completions=$(get_users)
            ;;
    esac

    if [[ "$cur" == //depot/* && -z "$P4_DISABLE_DEPOT_COMPLETION" ]]; then
        completions=$(get_depot_completion $cur)
    fi
    
    COMPREPLY=( $(compgen -W "$completions" -- $cur) )
}

complete -o default -F _p4_commands p4
