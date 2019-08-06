"====================================================================
"                                general
"====================================================================
set encoding=utf-8
set nocompatible   "not compatible with old version
"set mouse=a       "enable mouse
set wildmenu       "vim-cmd auto complete
"set clipboard      "copy to os clipboard via register */+

"layout
set laststatus=2    "status bar
set ruler           "cursor-pos
set number          "line-num
set nowrap          "no wrap
set cursorline      "highlight current line

"search
set hlsearch        "highlight result
set incsearch       "search instantly
set ignorecase      "case insensitive
set smartcase       "case insensitive for 'abc', sensitive for 'aBc'

"fold
set foldmethod=syntax
set nofoldenable

"indent
set autoindent    "auto copy current-line's tab to new line
set expandtab     "auto change tab to space
set tabstop=2     "show tab as X space
set shiftwidth=2  "add X space when use << >>
"set softtabstop=4 "treat consistant space as tab
filetype plugin indent on
au Filetype javascript setlocal cindent
au Filetype html,j2    setlocal shiftwidth=2 tabstop=2

"auto load template
au BufNewFile *.hpp    0r ~/config/vim-skeleton/skel.hpp
au BufNewFile *.h      0r ~/config/vim-skeleton/skel.h
au BufNewFile *.cpp    0r ~/config/vim-skeleton/skel.cpp
au BufNewFile *.c      0r ~/config/vim-skeleton/skel.c
au BufNewFile *.m      0r ~/config/vim-skeleton/skel.m
au BufNewFile *.l      0r ~/config/vim-skeleton/skel.l
au BufNewFile *.y      0r ~/config/vim-skeleton/skel.y
au BufNewFile *.html   0r ~/config/vim-skeleton/skel.html
au BufNewFile *.py     0r ~/config/vim-skeleton/skel.py
au BufNewFile *.js     0r ~/config/vim-skeleton/skel.js
au BufNewFile *.sh     0r ~/config/vim-skeleton/skel.sh
au BufNewFile Makefile 0r ~/config/vim-skeleton/Makefile

"history
set history=50
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

"restore last visit-position when reopen a file
au BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" Set scripts to be executable from the shell
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent execute "!chmod a+x <afile>" | endif | endif

"====================================================================
"                                 plugins
"====================================================================

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/fonts'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'solarnz/thrift.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rhysd/vim-clang-format'
call vundle#end()

filetype plugin indent on

"====================================================================
"                              appearance
"====================================================================

colorscheme molokai

syntax enable
syntax on

set t_Co=256      " use 265 colors in vim

hi Normal ctermfg=254 ctermbg=none
hi ColorColumn ctermbg=236

"youcompleteme
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_confirm_extra_conf=0

"file-explorer
let g:netrw_sort_sequence='[\/]$'
"let g:netrw_sort_sequence='[\/]$,\<core\%(\.\d\+\)\=,\.[a-np-z]$,\.*,~$'

"airline
let g:airline_powerline_fonts=1
let g:airline_theme="powerlineish"
let g:airline#extensions#tabline#enabled=1

"====================================================================
"                               hotkey
"====================================================================
let mapleader=";"  "set leader key

set pastetoggle=<leader>p

" input mode
"inoremap " ""<left>
"inoremap [ []<left>
"inoremap ( ()<left>
"inoremap { {}<left>

" normal mode
nnoremap <C-p> :bprev<cr>
nnoremap <C-n> :bnext<cr>

nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>e :q!<cr>
nnoremap <leader>v :vsp<cr>
nnoremap <leader>b :bn\|bd #<cr>
nnoremap <leader>h :sp<cr>
nnoremap <leader>l :Explore<cr>
nnoremap <leader>m :message<cr>
nnoremap <leader>n :noh<cr>
nnoremap <leader>r @:
nnoremap <leader>j <C-w>w
nnoremap <leader>k <C-w>p
nnoremap <leader>1 :! 
nnoremap <leader>x :YcmCompleter FixIt<cr>

" visual and select mode
vnoremap . :norm.<cr>

" visual mode 
vnoremap p pgvy

" plugin hotkey
nnoremap <leader>d :YcmCompleter GoTo<CR>
nnoremap <leader>f :ClangFormat<CR>
