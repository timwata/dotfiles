au BufNewFile,BufRead *.zsh set filetype=sh
au FileType sh setlocal errorformat=%f:\ line\ %l:\ %m

au BufNewFile,BufRead *.md  set filetype=mkd
au FileType mkd nnoremap <silent> <C-p> :PrevimOpen<CR>

au BufNewFile,BufRead Vagrantfile set filetype=ruby

autocmd BufNewFile *.html 0r $HOME/.vim/template/html

au FileType perl :compiler perl
autocmd BufNewFile *.pl   0r $HOME/.vim/template/pl

autocmd BufNewFile *.rb   0r $HOME/.vim/template/rb

au FileType go   :compiler go
autocmd BufNewFile *.go   0r $HOME/.vim/template/go

