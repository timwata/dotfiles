#
# completion
#
LISTMAX=0

autoload -U compinit
compinit

setopt auto_list
setopt list_packed
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt magic_equal_subst
setopt mark_dirs
setopt complete_aliases

zstyle ':completion:*:sudo:*' command-path ${PATH}
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward
