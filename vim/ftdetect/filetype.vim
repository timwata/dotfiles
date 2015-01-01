"
" zsh/bash
"
au BufNewFile,BufRead *.zsh set filetype=sh
au FileType sh setlocal errorformat=%f:\ line\ %l:\ %m

"
" markdown
"
au BufNewFile,BufRead *.md  set filetype=mkd
au FileType mkd nnoremap <silent> <C-p> :PrevimOpen<CR>

"
" html
"
au BufNewFile *.html 0r $HOME/.vim/template/html

"
" perl
"
au FileType perl :compiler perl
au BufNewFile *.pl   0r $HOME/.vim/template/pl

"
" ruby
"
au BufNewFile *.rb   0r $HOME/.vim/template/rb
au BufNewFile,BufRead Vagrantfile set filetype=ruby

"
" golang
"
au FileType go   :compiler go
au BufNewFile *.go   0r $HOME/.vim/template/go

"
" unite
"
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
