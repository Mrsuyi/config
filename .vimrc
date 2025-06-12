set nocompatible

" Vundle Plugin
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'fcpg/vim-osc52'
Plugin 'google/vim-maktaba'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'mhinz/vim-signify'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'powerline/fonts'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'
Plugin 'VundleVim/Vundle.vim'

" Use Google-internal setup.
if filereadable(expand('~/.vimrc_google'))
  source ~/.vimrc_google
else
  Plugin 'google/vim-codefmt'
  Plugin 'google/vim-glaive'
  Plugin 'Valloric/YouCompleteMe'
endif

call vundle#end()

"====================================================================
"                                general
"====================================================================
set encoding=utf-8
set wildmenu                           " vim-cmd auto complete
set mouse=a                            " mouse mode
set laststatus=2                       " status bar
set ruler                              " cursor-pos
set number                             " line-num
set nowrap                             " no wrap
set cursorline                         " highlight current line
set ttyfast lazyredraw                 " make drawing faster
set hlsearch                           " highlight result
set incsearch                          " search instantly
set smartcase                          " case insensitive for 'abc', sensitive for 'aBc'
set backspace=indent,eol,start         " make backspace sane
set foldmethod=syntax
set nofoldenable
set autoindent                         " auto copy current-line's tab to new line
set expandtab                          " auto change tab to space
set tabstop=2                          " show tab as X space
set shiftwidth=2                       " add X space when use << >>
set softtabstop=2                      " treat consistant space as tab
set ignorecase                         " ignore case in cmd completion
au Filetype javascript setlocal cindent
au Filetype html,j2    setlocal shiftwidth=2 tabstop=2

"history
set history=1000
set undofile
set undodir=$HOME/.vim/undo     "This dir must exist.
set undolevels=1000
set undoreload=10000

"restore last visit-position when reopen a file
au BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" Set scripts to be executable from the shell
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent execute "!chmod a+x <afile>" | endif | endif

" Automatically change the working path to the path of the current file
autocmd BufNewFile,BufEnter * silent! lcd %:p:h<F29>

" Automatically format files on save
"au BufWrite * :AutoFormat

" Make yank work
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" Keep clipboard content when Vim exits or suspends.
if executable("xsel")
  function! PreserveClipboard()
    call system("xsel -ib", getreg('+'))
  endfunction
  function! PreserveClipboadAndSuspend()
    call PreserveClipboard()
  suspend
  endfunction
  autocmd VimLeave * call PreserveClipboard()
  nnoremap <silent> <c-z> :call PreserveClipboadAndSuspend()<cr>
  vnoremap <silent> <c-z> :<c-u>call PreserveClipboadAndSuspend()<cr>
endif

"====================================================================
"                                format
"====================================================================

" Enable file type based indent configuration and syntax highlighting.
" Note that when code is pasted via the terminal, vim by default does not detect
" that the code is pasted (as opposed to when using vim's paste mappings), which
" leads to incorrect indentation when indent mode is on.
" To work around this, use ":set paste" / ":set nopaste" to toggle paste mode.
" You can also use a plugin to:
" - enter insert mode with paste (https://github.com/tpope/vim-unimpaired)
" - auto-detect pasting (https://github.com/ConradIrwin/vim-bracketed-paste)
filetype plugin indent on
syntax on

""" Formatters
augroup autoformat_settings
  autocmd FileType borg,gcl,patchpanel AutoFormatBuffer gclfmt
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType javascript,typescript,typescriptreact AutoFormatBuffer google-prettier
  autocmd FileType jslayout AutoFormatBuffer jslfmt
  autocmd FileType markdown AutoFormatBuffer mdformat
  autocmd FileType ncl AutoFormatBuffer nclfmt
  autocmd FileType proto AutoFormatBuffer protofmt
  autocmd FileType python,piccolo AutoFormatBuffer pyformat
  autocmd FileType sql,sdl AutoFormatBuffer format_sql
  autocmd FileType textpb AutoFormatBuffer text-proto-format
augroup END

function! ToggleAutoFormatSettings()
  if get(b:, 'codefmt_auto_format_buffer', 0)
    NoAutoFormatBuffer
    echo "[-] Automatic formatting is disabled."
  else
    AutoFormatBuffer
    echo "[+] Automatic formatting is enabled."
  endif
endfunction

"====================================================================
"                              appearance
"====================================================================

colorscheme molokai
set t_Co=256      " use 265 colors in vim
hi Normal ctermfg=254 ctermbg=none
" fix molokai highlighting braces.
hi MatchParen guifg=#FD971F guibg=#000000 gui=bold
hi MatchParen ctermfg=208 ctermbg=233 cterm=bold

"youcompleteme
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_confirm_extra_conf=0

" file-explorer
let g:netrw_sort_sequence='[\/]$'
"let g:netrw_sort_sequence='[\/]$,\<core\%(\.\d\+\)\=,\.[a-np-z]$,\.*,~$'

" airline
let g:airline_powerline_fonts=1
let g:airline_theme="powerlineish"
let g:airline#extensions#tabline#enabled=1

"====================================================================
"                               hotkey
"====================================================================
let mapleader=";"  "set leader key

set pastetoggle=<leader>p

nnoremap <C-p> :bprev<cr>
nnoremap <C-n> :bnext<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>v :vsp<cr>
nnoremap <leader>e :bn\|bd #<cr>
nnoremap <leader>h :sp<cr>
nnoremap <leader>l :Explore<cr>
nnoremap <leader>m :message<cr>
nnoremap <leader>n :noh<cr>
nnoremap <leader>j <C-w>w
nnoremap <leader>k <C-w>p
nnoremap <leader>1 :! 
vnoremap . :norm.<cr>
vnoremap p pgvy
" plugin hotkey
vmap <C-c> y:Oscyank<cr> xmap <F7> y:Oscyank<cr>
nnoremap <leader>f :ClangFormat<cr>
nnoremap <leader>a :call ToggleAutoFormatSettings()<cr>
nnoremap <leader>g :YcmCompleter GoTo<cr>
nnoremap <leader>x :YcmCompleter FixIt<cr>
nnoremap <leader>i :YcmShowDetailedDiagnostic<cr>
