# vim: ts=4:sw=4:expandtab
alias emacs=vim

export SHELL=$(which zsh)
export ZSH=${HOME}/dotfiles/zsh

typeset -U path PATH

export PATH=/usr/local/bin:${PATH}
if [ -d ${HOME}/bin ]
then
    export PATH=${HOME}/bin:${PATH}
fi

case ${OSTYPE} in
    darwin*)
        type brew > /dev/null 2>&1 || {
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
            brew update
            brew install caskroom/cask/brew-cask
        }
        type ag > /dev/null 2>&1 || {
            brew install ag
        }
        type peco > /dev/null 2>&1 || {
            brew tap peco/peco
            brew install peco
        }
        type VBoxManage > /dev/null 2>&1 || {
            brew cask install virtualbox
        }
        type packer > /dev/null 2>&1 || {
            brew tap homebrew/binary
            brew install packer
        }
        type vagrant > /dev/null 2>&1 || {
            brew cask install vagrant
            brew cask install vagrant-manager
        }
        ;;
    linux*)
        ;;
esac

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

