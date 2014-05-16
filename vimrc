set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-markdown'
Bundle 'airblade/vim-gitgutter'
Bundle 'slim-template/vim-slim'
Bundle 'skalnik/vim-vroom'

syntax enable
set encoding=utf-8
set showcmd
filetype plugin indent on

set laststatus=2

au BufNewFile,BufRead *.jbuilder set filetype=ruby
au BufRead,BufNewFile *.hamlc set ft=haml

" ruby path if you are using RVM
let g:ruby_path = system('rvm current')

autocmd FocusLost * call PopOutOfInsertMode()

function! PopOutOfInsertMode()
  if v:insertmode
    feedkeys("\<C-\>\<C-n>")
  endif
endfunction

set backupdir=/tmp
set directory=/tmp

colorscheme ir_black
set go-=r
set go-=L
set go-=T
highlight clear SignColumn

set number
set numberwidth=4
set ruler

" Folding
set foldmethod=indent
set foldminlines=2
set foldlevelstart=99

highlight Folded term=bold ctermbg=10 ctermfg=5 guibg=bg guifg=fg
highlight FoldColumn term=bold ctermbg=10 ctermfg=5 guibg=bg guifg=fg
hi StatusLine ctermbg=4

set foldtext=MyFoldFunction()
set fillchars=fold:\ ,vert:\|

function! MyFoldFunction()
  let line = getline(v:foldstart)
  let lastline = getline(v:foldend)
  let numfolded = v:foldend - v:foldstart + 1
  return line . ' ' . ' [' . numfolded . ' L] ' . lastline
endfunction

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

function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
nnoremap <silent> <leader>w :call TrimWhiteSpace()<CR>

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
    if part[0] =~ '\v[%#<]'
      let expanded_part = fnameescape(expand(part))
      let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
    endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction


" let g:gitroot = system("git rev-parse --show-toplevel")
" map <leader>S :exec "Shell rspec -f d " . g:gitroot<CR>
" map <leader>s :Shell rspec -f d %<CR>

let g:vroom_use_colors = 1
map <leader>s :call vroom#RunTestFile({'options':'--color -f d'})<cr>
map <leader>S :call vroom#RunNearestTest({'options':'--color -f d'})<cr>

autocmd FileWritePre      * :call TrimWhiteSpace()
autocmd FileAppendPre     * :call TrimWhiteSpace()
autocmd FilterWritePre    * :call TrimWhiteSpace()
autocmd BufWritePre       * :call TrimWhiteSpace()

autocmd QuickFixCmdPost *grep* cwindow

nnoremap <leader>l :Glog<CR>
nnoremap <leader>g :Ggrep
nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprev<CR>

let g:ctrlp_working_path_mode = 'r'
map <leader>t :CtrlP<cr>
map <leader>m :CtrlPMRU<cr>
map <leader>b :CtrlPBuffer<cr>
map <leader>r :CtrlPBuffer<cr><F5><Esc>
set wildignore+=*/tmp/*,*.o,*.zip,*.tgz,*/bin/*

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

inoremap <c-d> <esc>
nnoremap <c-d> <esc>
inoremap <c-c> <esc>

imap hh =>
imap jj ->
imap <F1> <esc>
nmap <F1> <esc>

map Y y$

" reselect blocks after indenting/dedenting
vnoremap < <gv
vnoremap > >gv

nmap <space> zA
nmap <nul> zM
