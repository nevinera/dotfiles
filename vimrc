call pathogen#infect()

set nocompatible
syntax enable
set encoding=utf-8
set showcmd
filetype plugin indent on

set backupdir=/tmp
set directory=/tmp

colorscheme ir_black
set go-=r
set go-=L
set go-=T

set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start

set hlsearch
set incsearch
set ignorecase
set smartcase

let mapleader=","

map <leader>t :CommandT<cr>
map <leader>r :CommandTFlush<cr>
nnoremap <leader><leader> <c-^>

nnoremap <c-e> 3<c-e>
nnoremap <c-y> 3<c-y>

map <leader>R :so $MYVIMRC<cr>

map <leader>j :split<cr><c-j>
map <leader>l :vsplit<cr><c-l>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

imap hh =>
imap jj ->
