"====================================================================
"                                general
"====================================================================
set nocompatible   "not compatible with old version
"set mouse=a        "enable mouse
set wildmenu       "vim-cmd auto complete

"show
set laststatus=2    "status bar
set ruler           "cursor-pos
set number          "line-num
set nowrap          "no wrap

"search
set hlsearch        "highlight result
set incsearch       "search instantly

"fold
set foldmethod=syntax
set nofoldenable

"indent
set expandtab     "auto change tab to space
set autoindent    "auto copy current-line's tab to new line
set cindent       "auto add extra tab on new line
set tabstop=4     "show tab as X space
set shiftwidth=4  "add X space when use << >>
set softtabstop=4 "treat consistant space as tab

"persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

"====================================================================
"                                 plugins
"====================================================================

"set rtp+=/usr/lib/python3.5/site-packages/powerline/bindings/vim "powerline

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
"Plugin 'derekwyatt/vim-fswitch'
"Plugin 'kshenoy/vim-signature'
"Plugin 'majutsushi/tagbar'
"Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/vimprj'
"Plugin 'dyng/ctrlsf.vim'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-scripts/DrawIt'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'derekwyatt/vim-protodef'
"Plugin 'scrooloose/nerdtree'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'gcmt/wildfire.vim'
"Plugin 'sjl/gundo.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'lilydjwg/fcitx.vim'
call vundle#end()

filetype plugin indent on

"====================================================================
"                              appearance
"====================================================================

colorscheme molokai

syntax enable
syntax on

"set colorcolumn=80

set t_Co=256      " use 265 colors in vim
set guifont=YaHei\ consolas\ Hybrid\ 11.5

let loaded_matchparen = 1 "disable the fucking weird highlight

hi Normal ctermfg=254 ctermbg=none
hi ColorColumn ctermbg=236

"youcompleteme
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_confirm_extra_conf=0

"file-explorer
let g:netrw_sort_sequence='[\/]$,\<core\%(\.\d\+\)\=,\.[a-np-z]$,\.*,~$'

"airline
let g:airline_powerline_fonts=1
let g:airline_theme="powerlineish"

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
nnoremap <leader>Q :qa<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>W :wq<cr>
nnoremap <leader>v :vsp<cr>
nnoremap <leader>g <C-w>p
nnoremap <leader>h <C-w>w
nnoremap <leader>l :Explore<cr>
nnoremap <leader>n :noh<cr>
nnoremap <leader>r @:

" visual mode
vnoremap . :norm.<cr>

" plugin hotkey
nnoremap <leader>d :YcmCompleter GoTo<CR>

