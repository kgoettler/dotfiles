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
        mkdir -p ${outdir}
    fi
    ln -sf ${infile} ${outfile}
done

