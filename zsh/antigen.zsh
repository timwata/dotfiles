source ${ZSH}/antigen/antigen.zsh

antigen-bundle git
antigen-bundle extract

antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zaw
antigen-bundle zsh-users/zsh-completions
antigen-bundle zsh-users/zsh-history-substring-search

antigen-apply
