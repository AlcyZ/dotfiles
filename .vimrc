" Sets -------------------------------------------------- {{{ 

" disables vi compatibility
set nocompatible

" enable type file detection. Vim will be able to try to detect the type of file is use.
filetype on

" enable plugins and load plugin for the detected file type.
filetype plugin on

" load an indent file for the detected file type.
filetype indent on

" turn syntax highlighting on.
syntax enable

filetype plugin indent on

" change internal vim shell to fish
set shell=/usr/bin/fish

" automatically tries to source .vimrc from projects opened with `vim [path]`
set exrc

" displays relative line numbers and number of cursors line
set relativenumber
set nu

" disables highlight after performing a search
set nohlsearch

" keeps buffers (files) in RAM, so the save state is not important
set hidden

" don't wrap lines
set nowrap

" highlight search and ignore case when searching for lowercase strings
set incsearch
set ignorecase
set smartcase

" file history management
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Tab-key configuration, automatically replace tab with whitespaces and indent
" automatically
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" scroll experience
set scrolloff=8

" displays vertical bar at column 80 for easier visuall feedback
set colorcolumn=80

" left bar for linter and e.g. git and so on to place visual feedback
set signcolumn=yes

" more space to display messages
set cmdheight=2

" extend save history from default 20
set history=1000

" enable auto completion menu after pressing TAB.
set wildmenu

" make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" }}}

" Plugins ---------------------------------------------------- {{{

call plug#begin()

    Plug 'preservim/nerdtree'
    Plug 'doums/darcula'
    Plug 'rust-lang/rust.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'SirVer/ultisnips'
    Plug 'voronkovich/vim-composer-open-class-file'

call plug#end()

" }}}

" [UltiSnips] Plugin settings  ------------------------------------- {{{

" UltiSnips trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" :UltiSnipsEdit splits to vertical window
let g:UltiSnipsEditSplit="vertical"

" }}}

" Theme ------------------------------------------------------ {{{

colorscheme darcula

" }}}

" Keyboard mappings ------------------------------------------------------------ {{{

" set <Leader> key
let mapleader = "-"

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <Leader>1 :NERDTreeFind<cr>
nnoremap <Leader>2 :NERDTreeToggle<cr>

" composer open php file plugin
au FileType php nnoremap gf :call composer#open_file#open(expand('<cword>'))<CR>

" custom mappings
" nnoremap <c-o> :Files<cr>
nnoremap <Leader>o :Files<cr>

" open terminal in current dir
map <Leader>t :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR><c-w>x<c-w>j<c-w>7- cd $VIM_DIR<CR>

" }}}

" VIM Scripts ------------------------------------------------------------ {{{

" Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

