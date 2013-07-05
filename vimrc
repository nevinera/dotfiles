call pathogen#infect()

set nocompatible
syntax enable
set encoding=utf-8
set showcmd
filetype plugin indent on

au BufNewFile,BufRead *.jbuilder set filetype=ruby
au BufRead,BufNewFile *.hamlc set ft=haml

set backupdir=/tmp
set directory=/tmp

colorscheme ir_black
set go-=r
set go-=L
set go-=T
highlight clear SignColumn

set number
set numberwidth=5
set ruler

set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start

autocmd FileType c setlocal shiftwidth=2 tabstop=2

set hlsearch
set incsearch
set ignorecase
set smartcase

let mapleader=","

match ErrorMsg '\s\+$'

function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

nnoremap <silent> <leader>w :call TrimWhiteSpace()<CR>

autocmd FileWritePre      * :call TrimWhiteSpace()
autocmd FileAppendPre     * :call TrimWhiteSpace()
autocmd FilterWritePre    * :call TrimWhiteSpace()
autocmd BufWritePre       * :call TrimWhiteSpace()

autocmd QuickFixCmdPost *grep* cwindow

nnoremap <leader>l :Glog<CR>
nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprev<CR>

let g:ctrlp_working_path_mode = 2
map <leader>t :CtrlP<cr>
map <leader>m :CtrlPMRU<cr>
map <leader>b :CtrlPBuffer<cr>
map <leader>r :CtrlPBuffer<cr><F5><Esc>
set wildignore+=*/tmp/*,*.o,*.zip,*.tgz

nnoremap <c-e> 5<c-e>
nnoremap <c-y> 5<c-y>

" Reload the vimrc file without quitting vim
map <leader>R :so $MYVIMRC<cr>

map <leader>j :split<cr><c-j>
map <leader>l :vsplit<cr><c-l>

" Mappings for pane navigation.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
inoremap <c-j> <esc><c-w>j
inoremap <c-k> <esc><c-w>k
inoremap <c-h> <esc><c-w>h
inoremap <c-l> <esc><c-w>l

imap hh =>
imap jj ->

map Y y$

" reselect blocks after indenting/dedenting
vnoremap < <gv
vnoremap > >gv
