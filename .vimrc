syntax on

set splitright
set splitbelow

" something went wrong with backspace in vim
set bs=2
language en_US

" default tabs and indentation options
set autoindent
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
" extension based indentation options
autocmd FileType sh :setlocal sw=2 ts=2 sts=2 " Two spaces for bash files

" status line
set statusline=%t       "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
"set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

cabbrev E Explore

" vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
" add new plugins here

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" simple recursive grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
nmap ,R :RecurGrep
nmap ,r :RecurGrepFast
nmap ,wR :RecurGrep <cword><CR>
