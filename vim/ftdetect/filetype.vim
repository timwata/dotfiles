au BufNewFile,BufRead *.zsh set filetype=sh
au BufNewFile,BufRead *.md  set filetype=mkd
au BufNewFile,BufRead Vagrantfile set filetype=ruby

au FileType perl :compiler perl
au FileType go   :compiler go

au FileType sh setlocal errorformat=%f:\ line\ %l:\ %m
