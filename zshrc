alias emacs=vim
export ZSH=${HOME}/dotfiles/zsh
typeset -U path PATH

typeset -U config_files
config_files=($ZSH/*.zsh)

source ${ZSH}/alias.zsh

for file in ${${${config_files:#*/alias.zsh}:#*/completion.zsh}:#*/keybind.zsh}
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
