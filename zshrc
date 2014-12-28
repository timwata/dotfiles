alias emacs=vim
export SHELL=$(which zsh)
export ZSH=${HOME}/dotfiles/zsh
typeset -U path PATH

export PATH=/usr/local/bin:${PATH}

typeset -U config_files
config_files=($ZSH/*.zsh)

source ${ZSH}/alias.zsh
source ${ZSH}/color.zsh
source ${ZSH}/main.zsh

for file in ${config_files:#*/(alias|completion|keybind|main|color).zsh}
do
    source ${file}
done

autoload -U compinit
compinit

source ${ZSH}/completion.zsh
source ${ZSH}/keybind.zsh

if [[ -a ~/.local.zsh ]]
then
    source ~/.local.zsh
fi

unset config_files

# vim: ts=4:sw=4:expandtab
