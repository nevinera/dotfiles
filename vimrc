call pathogen#infect()

set nocompatible
syntax enable
set encoding=utf-8
set showcmd
filetype plugin indent on

set laststatus=2

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
set numberwidth=4
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


let g:gitroot = system("git rev-parse --show-toplevel")
map <leader>S :exec "Shell rspec -f d " . g:gitroot<CR>
map <leader>s :Shell rspec -f d %<CR>

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

imap hh =>
imap jj ->

map Y y$

" reselect blocks after indenting/dedenting
vnoremap < <gv
vnoremap > >gv
