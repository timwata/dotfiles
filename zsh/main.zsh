#
# main

# misc
export TERM=xterm-256color
export SHELL=$(which zsh)
export EDITOR=vim
setopt auto_pushd
setopt append_history
setopt no_beep
setopt no_flow_control
function chpwd() { ls }

autoload -Uz is-at-least
autoload -Uz add-zsh-hook


# History
HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_no_store
setopt hist_reduce_blanks
setopt share_history


# Prompt
COLOR_PROMPT=${YELLOWGREEN}
export PROMPT="
${COLOR_PROMPT}[%D{%e.%b.%Y %H:%M}] %n at $(hostname)
%1(v|%1v|)%/
%(?.%#.%U%#%u) ${DEFAULT}"


# Less Colors for Man Pages
export PAGER=less
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline


# screen
export SCREENDIR="${HOME}/.screen"
if [[ -n ${STY} ]];
then

    preexec_screen() {
        emulate -L zsh
        local -a cmd; cmd=(${(z)2})
        echo -ne "\ek$cmd[1]:t\e\\"
    }
    add-zsh-hook preexec preexec_screen
  
    precmd_screen() {
        echo -ne "\ek$(basename $PWD)\e\\"
    }
    add-zsh-hook precmd precmd_screen

fi


# git
if is-at-least 4.3.7;
then
  
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' formats '[%b] '
    zstyle ':vcs_info:*' actionformats '[%b|%a] '
  
    precmd_git () {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    }
    add-zsh-hook precmd precmd_git
fi
 
function archive() {
    cd && tar zcvf dotfiles.tgz .vim .antigen dotfiles
}

function dotsync() {
    if [ $# -ne 1 ]
    then
        return
    fi
    
    rsync -av --delete -e 'ssh -c arcfour' ${HOME}/dotfiles/ $1:dotfiles
    ssh $1 'cd dotfiles && make'
}
