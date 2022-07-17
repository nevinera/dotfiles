set nocompatible
filetype on

colorscheme ir_black

set nowrap
set tabstop=2 shiftwidth=2 expandtab
set backspace=indent,eol,start
set hlsearch incsearch ignorecase smartcase
set number numberwidth=3 ruler


" -------- plugins --------

" https://github.com/junegunn/vim-plug#usage
" Run `:PlugUpdate` to install/update plugins
" Run `:PlugUpgrade` to upgrade vim-plug itself
"
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'dense-analysis/ale'
call plug#end()


" --- keybinds ---

let mapleader=","

" scroll faster
nnoremap <c-e> 5<c-e>
nnoremap <c-y> 5<c-y>

" escape-replaceents
inoremap <c-d> <esc>
nnoremap <c-d> <esc>
inoremap <c-c> <esc>

" pane navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <bs> <c-w>h
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
inoremap <c-j> <esc><c-w>j
inoremap <c-k> <esc><c-w>k
inoremap <c-h> <esc><c-w>h
inoremap <c-l> <esc><c-w>l
map <leader>j :split<cr><c-j>
map <leader>l :vsplit<cr><c-l>

" file navigation
let g:fzf_mru_relative = 1 
let g:fzf_mru_exclude_current_file = 0
let g:fzf_mru_no_sort = 1 " keep sorted by recency while filtering
map <leader>t :GFiles<cr>
map <leader>n :GFiles<cr>
map <leader>m :FZFMru<cr>
map <leader>x :e `git rev-parse --show-toplevel`<cr>

" fast sigils
imap hh =>
imap jj ->
imap jk {
imap kj }
imap hk [
imap kh ]

" oddly missing hotkeys
map Y y$

" reselect blocks after indenting/dedenting
vnoremap < <gv
vnoremap > >gv


" -------- linting --------

let g:ruby_path = system('rvm current')
let g:ale_linters = {'ruby': ['standardrb']}
let g:ale_fixers = {'ruby': ['standardrb']}
let g:ale_lint_on_save = 1
let g:ale_sign_error = '●●'
let g:ale_sign_warning = '--'
highlight clear SignColumn
set signcolumn=number

map <leader>f :ALEFix<cr>
highlight ALEWarning gui=undercurl cterm=undercurl
highlight ALEError gui=undercurl cterm=undercurl

" -------- folding --------

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
