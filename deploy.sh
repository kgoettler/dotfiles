#!/bin/bash

CURRENT_DIR=$(pwd)
dotfiles=(
    ".jupyter/jupyter_qtconsole_config.py"
    ".jupyter/jupyter_console_config.py"
    ".bash_profile"
    ".vimrc"
    ".inputrc"
    ".tmux.conf"
    ".config/nvim/init.vim"
    ".config/rofi/config"
    ".config/neofetch/config.conf"
    ".config/i3/config"
    ".config/polybar/config"
    ".config/compton.conf"
    ".conky/.conkyrc"
    )

for dotfile in "${dotfiles[@]}"; do
    infile="$(pwd)/${dotfile}"	
    outfile="${HOME}/${dotfile}"
    outdir=$(dirname ${outfile})
    if [ ! -d ${outdir} ]; then
        echo "Directory does not exist"
        #mkdir -p ${outdir}
    fi
    ln -sf ${infile} ${outfile}
done


#ln ./.jupyter/jupyter_qtconsole_config.py ~/.jupyter/jupyter_qtconsole_config.py 
#ln ./.jupyter/jupyter_console_config.py ~/.jupyter/jupyter_console_config.py
#ln ./.bash_profile ~/.bash_profile
#ln ./.vimrc ~/.vimrc
#ln ./.inputrc ~/.inputrc
#ln ./.tmux.conf ~/.tmux.conf
#ln ./.config/nvim/init.vim ~/.config/nvim/init.vim
#ln ./.config/rofi/config ~/.config/rofi/config
#ln ./.config/neofetch/config.conf ~/.config/neofetch/config.conf
#ln ./.config/i3/config ~/.config/i3/config
#ln ./.config/polybar/config ~/.config/polybar/config
#ln ./.config/compton.conf ~/.config/compton.conf
#ln ./.conky/.conkyrc ~/.config/.conky/.conkyrc
