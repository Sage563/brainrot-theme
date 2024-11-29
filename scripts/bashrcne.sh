#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

python3 freetskib.py | lolcat
neofetch | lolcat

iwantdopamine() 
{
    sl
}

nerdatcomp()
{
    nano hello.txt
}

ce()
{
    touch $1
    nano $1
}

die()
{
    exit
}

lol() {
    if [ -t 1 ]; then
        "$@" | lolcat
    else
        "$@"
    fi
}

# Loop through all executable commands in the system's PATH
for COMMAND in $(compgen -c); do
    # Create alias for the command to use 'lol' for its output
    alias "${COMMAND}=lol ${COMMAND}"
    
    # Optionally, create a hidden version of the command to run without the lolcat transformation
    #alias ".${COMMAND}=$(which ${COMMAND})"
done

alias ls='ls --color=auto'
PS1='$(echo "[\u@\h \W]\$" | lolcat) '
