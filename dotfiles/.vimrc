set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" extend fugitive with better branch and commit views
Plugin 'gregsexton/gitv'
" git gutter
Plugin 'airblade/vim-gitgutter'
" Check code syntax
Plugin 'scrooloose/syntastic'
" comment stuff out
Plugin 'tpope/vim-commentary' 
" misc functions for plugins
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
" browse tags in the current file
Plugin 'majutsushi/tagbar'
" allow easy surrouding
Plugin 'tpope/vim-surround'
" all comma objects to be a real object
Plugin 'austintaylor/vim-commaobject'
" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Ctrl-p fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'
" Buffergator (leader-b to display a list of buffers)
Plugin 'jeetsukumaran/vim-buffergator'
" Code completion
" On servers, probably want to use ervandew/supertab since it's 
"   more lightweight and doesn't require compilations
Plugin 'Valloric/YouCompleteMe'

" Program support
Plugin 'dgryski/vim-godef'
Plugin 'fatih/vim-go'
Plugin 'vim-ruby/vim-ruby'

" Solarized
" cd ~/.vim/bundle
" git clone git://github.com/altercation/vim-colors-solarized.git
" mv vim-colors-solarized ~/.vim/bundle
syntax enable
set background=dark
colorscheme Solarized
set mouse=a

" All of your Plugins must be added before the following line
call vundle#end()            " required

let mapleader="'"       " leader is apostraphe
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set expandtab           " tabs are spaces
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set incsearch           " search as characters are entered
set hlsearch            " highlight matches



filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" Set Vundle to use ssh
let g:vundle_default_git_proto = 'git'

" -----------------------------------------------------------------------
"     NERD tree settings
" -----------------------------------------------------------------------
let g:nerdtree_tabs_open_on_console_startup=1
" Open nerdtree if no file is specified
autocmd StdinReadPre * let s:std_in=1
" autocmd vimenter * NERDTree " sets nerdtree to open on start

" 'Hide nerdtree if not dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <C-n> :NERDTreeToggle<CR>


let NERDTreeQuitOnOpen=1
let g:NERDTreeWinSize=30
let g:NERDTreeWinPos = "left"
let NERDTreeMapOpenInTab='<ENTER>'

" cntrlp - git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
" :help ctrlp.txt
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'


" airline
set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '

" you complete me
let g:ycm_allow_changing_updatetime = 1         " leave my updatetime alone
let g:ycm_collect_identifiers_from_tags_files = 1
set completeopt="menu"                          " remove preview from completeopt

" ------------------------ Go def stuff ------------------------ "
"
au FileType go nmap <leader>t <Plug>(go-test)

au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

"tmuxline
let g:tmuxline_powerline_separators = 0

" set git gutter to update faster
set updatetime=100
let g:gitgutter_sign_column_always = 1

" set ruby to not do expensive syntax highlighting 
let ruby_no_expensive=1

" Set easytags to use project-dependent tags
set tags=./.tags;,~/.vimtags

"Set easytags to compile go-tags
let g:easytags_languages = {
    \   'language': {
    \     'go': 'gotags',
    \       'fileoutput_opt': '-f',
    \       'stdout_opt': '-f-',
    \       'recurse_flag': '-R'
    \   }
    \}

"Tagbar Options

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

nmap <F8> :TagbarToggle<CR>
"let g:tagbar_type_go = {  
"   \ 'ctagstype' : 'go',
"   \ 'kinds'     : [
"       \ 'p:package',
"       \ 'i:imports:1',
"       \ 'c:constants',
"       \ 'v:variables',
"       \ 't:types',
"       \ 'n:interfaces',
"       \ 'w:fields',
"       \ 'e:embedded',
"       \ 'm:methods',
"       \ 'r:constructor',
"       \ 'f:functions'
"   \ ],
"   \ 'sro' : '.',
"   \ 'kind2scope' : {
"       \ 't' : 'ctype',
"       \ 'n' : 'ntype'
"   \ },
"   \ 'scope2kind' : {
"       \ 'ctype' : 't',
"       \ 'ntype' : 'n'
"   \ },
"   \ 'ctagsbin'  : 'gotags',
"   \ 'ctagsargs' : '-sort -silent'
"   \ }

" Auto line numbers
set number

" Improved indentation on newline
set autoindent
set smartindent

" Tab control
set expandtab               " insert tabs rather than spaces for <Tab>
set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4               " the visible width of tabs
set softtabstop=4           " edit as if the tabs are 4 characters wide
set shiftwidth=4            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'
set completeopt+=longest

" code folding settings
set foldmethod=indent       " fold based on indent
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable            " don't fold by default
set foldlevel=2

" set default yank/copy/delete buffer to be system clipboard
set clipboard=unnamed

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros

" set a map leader for more key combos
let mapleader = '\'

" shortcut to save
nmap <leader>\ :w<cr>

" Set colours
syntax on                   " switch syntax highlighting on

set t_Co=256                " Explicitly tell vim that the terminal supports 256 colors"
set background=dark

" set line the cursor is on to be highlighted
set cursorline

" make comments and HTML attributes italic
highlight htmlArg cterm=italic
