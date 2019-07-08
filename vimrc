set nocompatible
filetype off

set runtimepath+=/Users/emueller/.vim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('/Users/emueller/.vim/dein')
  call dein#begin('/Users/emueller/.vim/dein')

  " Let dein manage dein
  call dein#add('/Users/emueller/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  " To perform installs: `call dein#install()`
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('tpope/vim-markdown')
  call dein#add('scrooloose/syntastic')
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('isRuslan/vim-es6')
  call dein#add('leafgarland/typescript-vim')
  " call dein#add('skalnik/vim-vroom')
  call dein#add('kchmck/vim-coffee-script')
  " call dein#add('slim-template/vim-slim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

syntax enable
set encoding=utf-8
set showcmd
filetype plugin indent on

set laststatus=2
if has("mouse")
  set mouse=a
endif

au BufNewFile,BufRead *.jbuilder set filetype=ruby
au BufRead,BufNewFile *.hamlc set ft=haml
au BufWinEnter *.rb let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
au BufWinEnter *.md let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
au BufWinEnter *.haml let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)

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

nmap <space> za
nmap <nul> zM

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

set lazyredraw

" Syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_highlighting = 0

" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': [] }

nnoremap <C-s> :SyntasticCheck<CR>
map <leader>, :SyntasticCheck<CR>
map <leader>. :lclose<CR>

" :SyntasticToggleMode<CR>

" map <leader>? :SyntasticCheck<CR>
" map <leader>s :lnext<CR>
" map <leader>S :lprev<CR>

set number
set numberwidth=3
set ruler


autocmd FileWritePre      *.rb :call TrimWhiteSpace()
autocmd FileAppendPre     *.rb :call TrimWhiteSpace()
autocmd FilterWritePre    *.rb :call TrimWhiteSpace()
autocmd BufWritePre       *.rb :call TrimWhiteSpace()

autocmd FileWritePre      *.md :call TrimWhiteSpace()
autocmd FileAppendPre     *.md :call TrimWhiteSpace()
autocmd FilterWritePre    *.md :call TrimWhiteSpace()
autocmd BufWritePre       *.md :call TrimWhiteSpace()

autocmd FileWritePre      *.haml :call TrimWhiteSpace()
autocmd FileAppendPre     *.haml :call TrimWhiteSpace()
autocmd FilterWritePre    *.haml :call TrimWhiteSpace()
autocmd BufWritePre       *.haml :call TrimWhiteSpace()

autocmd QuickFixCmdPost *grep* cwindow

nnoremap <leader>l :Glog<CR>
nnoremap <leader>g :Ggrep

" I do this WAY too often
command Write write
command Wq wq
command WQ wq

let g:ctrlp_user_command = 'cd %s && git ls-files'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_mruf_relative = 1

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

map <leader>t :CtrlP<cr>
map <leader>m :CtrlPMRU<cr>
map <leader>b :CtrlPBuffer<cr>
map <leader>r :CtrlPBuffer<cr><F5><Esc>

map <leader>x :e `git rev-parse --show-toplevel`<cr>

" let g:CommandTMaxFiles=100000
" let g:CommandTMaxCachedDirectories=0

" map <leader>t :CommandT<cr>
" map <leader>b :CommandTBuffer<cr>
" map <leader>m :CommandTMRU<cr>

set wildignore+=*/tmp/*,*.o,*.zip,*.tgz,*/node_modules/*,*/bower_components/*

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
nnoremap <bs>  <c-w>h
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
