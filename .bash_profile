# Main
time_start=$(expr `date +%s%N` / 1000)

# Basic functions
has() {
    _cmd=$(command -v "$1") 2>/dev/null || return 1
    [ -x "$_cmd" ] || return 1
}

get_duration() {
    time_start="$1"
    time_end="$2"
    startup_time=$(expr $time_end - $time_start)
    startup_time=$(expr $startup_time / 1000)
    msg="Startup time: $startup_time ms"
    echo "$msg"
}

if has fff; then
    ff() {
        fff "$@"
        cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
    }
fi

#echo "+-----------------------------------------------+
#|     __                    __  __  __          |
#|    / /______ _____  ___  / /_/ /_/ /__  _____ |
#|   / //_/ __ \`/ __ \/ _ \/ __/ __/ / _ \/ ___/ |
#|  / ,< / /_/ / /_/ /  __/ /_/ /_/ /  __/ /     |
#| /_/|_|\__, /\____/\___/\__/\__/_/\___/_/      |
#|      /____/                                   |
#+-----------------------------------------------+
#"

# Determine if this is Cygwin/WSL and, if so, determine the location of the C drive
kernel_name=$(uname -s)
if [[ "$kernel_name" == "CYGWIN"* ]]; then
    # Cygwin
    export C_DRIVE="/cygdrive/c/"
elif [[ "$kernel_name" == "Linux" ]] && grep -qi microsoft /proc/version; then
    # WSL
    export C_DRIVE="/mnt/c/"
else
    unset C_DRIVE
fi

# Check for a .env file
# This contains environment (i.e. machine) specific configuration
# Useful for work-specific config, etc.
if [ -f "${HOME}/.env" ]; then
    source "${HOME}/.env"
fi

# grab bashrc (if necessary) if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

if [ -f ~/.dircolors ]; then
    eval `dircolors ~/.dircolors`
fi

complete -r
shopt -s direxpand

export PS1="\[\e[32m\]\u@\[\e[33m\]work\[\e[m\] \[\e[34m\]\w\n\[\e[m\]\$ "
export VISUAL=nvim; 
export EDITOR=nvim;
export GPG_TTY=$(tty)

# Aliases
alias ls="ls -p --color=auto"
alias ll="ls -la"
alias grep="grep --color"
alias vim="nvim"

# Aliases for taskwarrior
if command -v task &> /dev/null; then
    alias in='task add +in'
fi

if command -v exa &> /dev/null; then
    alias ee='exa -lhHg'
fi


function colortest {
#   This file echoes a bunch of color codes to the
#   terminal to demonstrate what's available.  Each
#   line is the color code of one forground color,
#   out of 17 (default + 16 escapes), followed by a
#   test use of that color on all nine background
#   colors (default + 8 escapes).
#
    clear
    T='gYw'   # The test text

    echo -e "\n                 40m     41m     42m     43m     44m     45m     46m     47m";

    for FGs in '   0m' ' 1;0m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
               '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
               '  36m' '1;36m' '  37m' '1;37m';
    do 
        FG=${FGs// /}
        echo -en " $FGs \033[$FG  $T  "
        for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
        do 
            echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
        done
        echo;
    done
    echo
}

function unix2win {
    out="$1"
    out=${out/${C_DRIVE}/C:\/}
    echo "$out"
}

function winpwd {
    out=$(pwd)
    out=${out/${C_DRIVE}/C:\/}
    out=${out/\/home\/kgoettler\//Z:\/home\/kgoettler\/}
    echo "$out" | clip.exe
}
    
function csv {
    cat $1 | column -t -s, | less -S
}

function winmount {
    sudo mount -t drvfs $1 $2
}

function open {
    cmd.exe /C start $1
}

function getlines {
    sed -n "${1},${2}p" ${3}
}

function ssh-tunnel {
    ssh -f -N -L "$1":127.0.0.1:"$1" -i ~/.ssh/kgoettler.pem ec2-user@"$2"
}

# ffile = "first file"
# Quick wrapper to return the first result from an ls call
# Useful when you want to do something with a single sample file
# e.g. dcmdump $(ffile)
function ffile {
    ls -1 $@ | head -n 1
}

function sumlist {
    paste -s -d + - | bc
}

function nnote {
    ts=$(date +%Y-%m-%d)
    notefile="$HOME/notes/${ts}.md"
    touch $notefile
    vim $notefile
}

# Start Docker
if service docker status 2>&1 | grep -q "is not running"; then
    echo "Starting docker"
    wsl.exe -d "${WSL_DISTRO_NAME}" -u root -e /usr/sbin/service docker start >/dev/null 2>&1
fi

time_end=$(expr `date +%s%N` / 1000)
startup_time=$(expr $time_end - $time_start)
startup_time=$(expr $startup_time / 1000)
msg="Startup time: $startup_time ms"
if command -v cowsay &> /dev/null; then
    cowsay "$msg"
else
    echo "$msg"
fi

eval "$(direnv hook bash)"
