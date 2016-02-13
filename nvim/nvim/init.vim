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
set laststatus=2
set showcmd
" ...allow buffers to be hidden even if modified
set hidden

" Splitting & executing stuff in the new window
nmap <silent> <Leader>ss :vsp<CR>
nmap <silent> <Leader>st :vsp term://zsh<CR>:startinsert<CR>

" Quickly drop into terminal
nmap <silent> <Leader>tt :e term://zsh<CR>:startinsert<CR>

" Toggles
nmap <silent> <Leader>xp :set paste!<CR>

" Escape from terminal mode with double ESC
tnoremap <ESC><ESC> <C-\><C-n>

" Go to any buffer by number (1-99)
let c = 1
while c <= 99
  execute "nnoremap <Leader>" . c . " :" . c . "b\<CR>"
  let c += 1
endwhile

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
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-bufferline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'easymotion/vim-easymotion'
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
call plug#end()

" Config bufferline
let g:bufferline_echo = 0
function! StatusBufferLine()
  let st=g:bufferline#refresh_status()
  return g:bufferline_status_info.before . g:bufferline_status_info.current . g:bufferline_status_info.after
endfunction

" Config CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\deps|\target|\_site)$',
  \ 'file': '\v\.(o|so|class|jar|png|jpg|jpeg)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nnoremap <Leader>p <Nop>
nnoremap <Leader>b <Nop>
nmap <silent> <Leader>pp :CtrlPMixed<CR>
nmap <silent> <Leader>pw :CtrlPMixed<CR><C-\>w
nmap <silent> <Leader>bb :CtrlPBuffer<CR>
nmap <silent> <Leader>bm :CtrlPMRU<CR>

" Config EasyMotion
let g:EasyMotion_do_mapping = 0
nmap <silent> <Leader><Leader> <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

" Config Lightline
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename' ],
  \             [ 'bufferline' ] ]
  \ },
  \ 'component': {
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'component_function': {
  \   'bufferline': 'StatusBufferLine'
  \ },
  \ 'component_visible_condition': {
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ }
  \ }

" Config rainbow parens
syntax on
let g:rainbow_active = 1
let g:rainbow_conf = {
  \ 'ctermfgs': ['red', 'green', 'blue']
  \}

" Config NerdTree
nmap <silent> <Leader>xn :NERDTreeToggle<CR>
let NERDTreeShowBookmarks = 1

" Fugitive mapping
nmap <silent> <Leader>gb :Gblame<cr>
nmap <silent> <Leader>gc :Gcommit<cr>
nmap <silent> <Leader>gd :Gdiff<cr>
nmap <silent> <Leader>gl :Glog<cr>
nmap <silent> <Leader>gp :Git pull<cr>
nmap <silent> <Leader>gP :Git push<cr>
nmap <silent> <Leader>gs :Gstatus<cr>
nmap <silent> <Leader>gw :Gbrowse<cr>
nmap <silent> <Leader>g? :map <Leader>g<cr>

" Default colorscheme
colorscheme 256_noir
