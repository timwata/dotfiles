syntax on
set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
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
set shiftwidth=2
set softtabstop=2
set expandtab

autocmd BufWinLeave ?* silent mkview
autocmd BufWinEnter ?* silent loadview

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
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'travitch/hasksyn'

filetype plugin indent on
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
nnoremap <silent> uff :<C-u>Unite file<CR>
nnoremap <silent> ubb :<C-u>Unite buffer<CR>
nnoremap <silent> umm :<C-u>Unite file_mru<CR>

"
" minibufexpl
" 
nnoremap gbb :MBEToggle<CR>
"nnoremap gbg :MiniBufExplorer<CR>
let g:miniBufExplVSplit = 15
let g:miniBufExplorerMoreThanOne = 0
"let g:miniBufExplCloseOnSelect = 1
