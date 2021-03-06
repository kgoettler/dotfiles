#PS1='\[\e[32m\]\u@\[\e[33m\]\h\[\e[0m\]:$ '
LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
export $LS_COLORS
PS1='~ \[\e[32m\]>\[\e[33m\]>\[\e[31m\]>\[\e[0m\] '
# Aliases
alias ls="ls -pG --color=auto"
alias ll="ls -la"
alias vim="nvim"
alias open="gio open"

function colortest {
#   Daniel Crisman's ANSI color chart script from
#   The Bash Prompt HOWTO: 6.1. Colours
#   http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
#  
#   This function echoes a bunch of color codes to the 
#   terminal to demonstrate what's available.  Each 
#   line is the color code of one forground color,
#   out of 17 (default + 16 escapes), followed by a 
#   test use of that color on all nine background 
#   colors (default + 8 escapes).
#

T='•••'   # The test text

#echo -e "\n                 40m     41m     42m     43m     44m     45m     46m     47m";

for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
'1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
'  36m' '1;36m' '  37m' '1;37m';

do FG=${FGs// /}
echo -en " \033[$FG  $T  "

for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
done
echo;
done
echo
}

function greload {
    gsettings set org.gnome.desktop.interface gtk-theme "UrsaMajor"
    gsettings set org.gnome.desktop.interface gtk-theme "TESTER"
}

function colors {
    T='•••'
    for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
        '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
    '  36m' '1;36m' '  37m' '1;37m'; do
        FG=${FGs// /}
        echo -en "$EINS \033[$FG $T \033[0m";
    done
    echo;
}
