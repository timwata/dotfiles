filetype off
filetype plugin indent off

set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set cmdheight=2
set number
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

"autocmd BufWinLeave ?* silent mkview
"autocmd BufWinEnter ?* silent loadview
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

map Y y$
nnoremap <C-L> :nohl<CR><C-L>
if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
if has('lua')
    NeoBundle 'Shougo/neocomplete.vim'
else
    NeoBundle 'Shougo/neocomplcache.vim'
endif
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'travitch/hasksyn'
NeoBundle 'surround.vim'
NeoBundle 'vim-scripts/Align'
NeoBundle 'othree/eregex.vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'kana/vim-submode'
NeoBundle 'rking/ag.vim'
NeoBundle 'joker1007/vim-markdown-quote-syntax'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }
NeoBundle "osyo-manga/unite-quickfix"
NeoBundle "osyo-manga/shabadou.vim"
NeoBundle "ap/vim-buftabline"
NeoBundle "tpope/vim-endwise"
NeoBundle "tomtom/tcomment_vim"
NeoBundle "Yggdroot/indentLine"
NeoBundle "tpope/vim-fugitive"

NeoBundleCheck

"
" colors
" 
set t_Co=256
set cursorline
colorscheme hybrid
let g:lightline = {}
let g:lightline.colorscheme = 'wombat'

"
" unite
" 
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> <C-k>f :<C-u>Unite file<CR>
nnoremap <silent> <C-k>b :<C-u>Unite buffer<CR>
nnoremap <silent> <C-k>m :<C-u>Unite file_mru<CR>


"
" neocomp{letecache|ete}
"
if has('lua')
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#manual_completion_start_length = 3
    let g:neocomplete#auto_completion_start_length = 4
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#enable_fuzzy_completion = 1
else
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_enable_camel_case_completion  =  1
    let g:neocomplcache_max_list = 20
    let g:neocomplcache_min_syntax_length = 3
endif


"
" eregex
"
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?


"
" submode
"
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')


"
" markdown
"
let g:vim_markdown_folding_disabled=1


"
" quickrun
"
let g:quickrun_config = {
\   "_" : {
\       "hook/close_quickfix/enable_hook_loaded" : 1,
\       "hook/close_quickfix/enable_success" : 1,
\       "hook/close_buffer/enable_failure" : 1,
\       "hook/close_buffer/enable_empty_data" : 1,
\       "outputter" : "multi:buffer:quickfix",
\       "hook/shabadoubi_touch_henshin/enable" : 1,
\       "hook/shabadoubi_touch_henshin/wait" : 20,
\       "outputter/buffer/split" : ":botright 8sp",
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 40,
\   }
\}
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
nnoremap <silent> rr :QuickRun<CR>


"
" vim-buftabline
"
set hidden
nnoremap <tab> :bnext<CR>
nnoremap <S-tab> :bprev<CR>


"
" indentLine
"
let g:indentLine_faster = 1


"
" vim-go
"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1


"
" fugitive
"


"
" finalize
"
filetype plugin indent on
syntax on
