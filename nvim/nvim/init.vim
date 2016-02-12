" Change the mapleader from \ to SPACE
let mapleader=" "
nnoremap <SPACE> <Nop>

" General stuff
set number
set nobackup
set nowritebackup
set noswapfile
set tabstop=2
set shiftwidth=2
set shiftround
set splitright
" ...allow buffers to be hidden even if modified
set hidden

" Splitting & executing stuff in the new window
nmap <silent> <Leader>ss :vsp<CR>
nmap <silent> <Leader>st :vsp term://zsh<CR>:startinsert<CR>

" Escape from terminal mode with double ESC
tnoremap <ESC><ESC> <C-\><C-n>

" Consistent window navigation with Alt + h/j/k/l
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
tnoremap <A-Left>  <C-\><C-n><C-w>h
tnoremap <A-Down>  <C-\><C-n><C-w>j
tnoremap <A-Up>    <C-\><C-n><C-w>k
tnoremap <A-Right> <C-\><C-n><C-w>l
nnoremap <A-Left>  <C-w>h
nnoremap <A-Down>  <C-w>j
nnoremap <A-Up>    <C-w>k
nnoremap <A-Right> <C-w>l

" Make windows bigger / smaller with +/-
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'ervandew/supertab'
Plug 'godlygeek/csapprox'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'terryma/vim-multiple-cursors'
call plug#end()

" Config CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\deps|\target|\_site)$',
  \ 'file': '\v\.(o|so|class|jar|png|jpg|jpeg)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nmap <silent> <Leader>pp :CtrlPMixed<CR>
nmap <silent> <Leader>pw :CtrlPMixed<CR><C-\>w
nmap <silent> <Leader>bb :CtrlPBuffer<CR>
nmap <silent> <Leader>bm :CtrlPMRU<CR>

" Config CS Approx (terminal color approximation)
let g:CSApprox_hook_post = [
  \ 'highlight Normal            ctermbg=NONE',
  \ 'highlight LineNr            ctermbg=NONE',
  \ 'highlight SignifyLineAdd    cterm=bold ctermbg=NONE ctermfg=green',
  \ 'highlight SignifyLineDelete cterm=bold ctermbg=NONE ctermfg=red',
  \ 'highlight SignifyLineChange cterm=bold ctermbg=NONE ctermfg=yellow',
  \ 'highlight SignifySignAdd    cterm=bold ctermbg=NONE ctermfg=green',
  \ 'highlight SignifySignDelete cterm=bold ctermbg=NONE ctermfg=red',
  \ 'highlight SignifySignChange cterm=bold ctermbg=NONE ctermfg=yellow',
  \ 'highlight SignColumn        ctermbg=NONE',
  \ 'highlight CursorLine        ctermbg=NONE cterm=underline',
  \ 'highlight Folded            ctermbg=NONE cterm=bold',
  \ 'highlight FoldColumn        ctermbg=NONE cterm=bold',
  \ 'highlight NonText           ctermbg=NONE',
  \ 'highlight clear LineNr'
  \]

" Config rainbow parens
syntax on
let g:rainbow_active = 1
let g:rainbow_conf = {
  \ 'ctermfgs': ['red', 'green', 'blue']
  \}

" Config NerdTree
nmap <silent> <Leader>n :NERDTreeToggle<CR>

" Default colorscheme
"colorscheme preto
"colorscheme acme
colorscheme 256_noir
" Remove background set by colorscheme
hi Normal ctermbg=NONE
hi Comment ctermbg=NONE
hi Constant ctermbg=NONE
hi Special ctermbg=NONE
hi Identifier ctermbg=NONE
hi Statement ctermbg=NONE
hi PreProc ctermbg=NONE
hi Type ctermbg=NONE
hi Underlined ctermbg=NONE
hi Todo ctermbg=NONE
hi String ctermbg=NONE
hi Function ctermbg=NONE
hi Conditional ctermbg=NONE
hi Repeat ctermbg=NONE
hi Operator ctermbg=NONE
hi Structure ctermbg=NONE
