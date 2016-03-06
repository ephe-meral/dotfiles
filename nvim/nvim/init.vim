" Licensed WTFPL, as usual.
" -------------------------
" Ideas for consistency: (Ld = Leader key, i.e. SPACE)
" - Ld+[1-99]   = go to buffer by nr
" - Ld+b+[bnms] = buffer commands (b=search n=new m=MRU s=scratch)
" - Ld+g+[bdh]  = git commands (b=blame d=diff h=github)
" - Ld+p+[pw]   = ctrlp/vim-fetch (p=ctrlp w=fetch-file-under-cursor)
" - Ld+s+[st]   = vertical split (s=new-buf t=new-term)
" - Ld+t+[t]    = terminal commands (t=new-term)
" - Ld+x+[np]   = toggle (n=nerdtree p=paste)
" - Ld+Ld+[?]   = activate EasyMotion (overwin, 2 chars)
" - Esc+Esc     = escape from terminal mode

" Change the mapleader from \ to SPACE
let mapleader=" "
nnoremap <SPACE> <Nop>
" ...this is a issue with the terminal capability recognizer
" if it happens to be fixed, this can be removed.
" see https://github.com/neovim/neovim/issues/3211
map <silent> <F1> <Del>
imap <silent> <F1> <Del>
vmap <silent> <F1> <Del>

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
nmap <silent> <Leader>st :vsp term://zsh<CR>:file zsh<CR>:startinsert<CR>

" Quickly drop into terminal
nmap <silent> <Leader>tt :e term://zsh<CR>:file zsh<CR>:startinsert<CR>

" Toggles
nmap <silent> <Leader>xp :set paste!<CR>

" Switch to new buffer
nmap <silent> <Leader>bn :enew<CR>

" Escape from terminal mode with double ESC
tnoremap <ESC><ESC> <C-\><C-n>

" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·

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

" Make windows bigger / smaller with +/-
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Plugins
call plug#begin('~/.vim/plugged')
" Visuals & utils
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-sleuth'          " Takes care of figuring out indentation automagically
Plug 'luochen1990/rainbow'
Plug 'terryma/vim-multiple-cursors'
Plug 'mtth/scratch.vim'
" Git
Plug 'airblade/vim-gitgutter'    " Displays (+/-) in versioned files
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
" Completion & Movement
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion' " Type 2 characters and go to found location
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kopischke/vim-fetch'       " Enable :e path/to/file:42:7
" Syntax
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
call plug#end()

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
nmap <silent> <Leader>bb :CtrlPBuffer<CR>
nmap <silent> <Leader>bm :CtrlPMRU<CR>

" Config EasyMotion
let g:EasyMotion_do_mapping = 0
nmap <silent> <Leader><Leader> <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

" Config Vim-Fetch
function! NoScratchFetch()
  let type = &ft
  call fetch#cfile(v:count1)
  " If this is called from the scratch buffer,
  " go back to previous delete the scratch window
  " and load the recently opened buffer
  if type=='scratch'
    let window = winnr()
    let buffer = bufnr('%')
    :wincmd p
    exec 'close '.window
    exec 'buffer '.buffer
  endif
endfunction
nmap <silent> <Leader>pw :<C-U>call NoScratchFetch()<CR>

" Config Fugitive
nmap <Leader>g <Nop>
nmap <silent> <Leader>gb :Gblame<cr>
nmap <silent> <Leader>gd :Gdiff<cr>
" ...open in Github or W/e
nmap <silent> <Leader>gh :Gbrowse<cr>

" Config Lightline
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename', 'modified' ],
  \             [ 'fugitive' ] ]
  \ },
  \ 'component': {
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'component_visible_condition': {
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ }
  \ }

" Config NerdTree
nmap <silent> <Leader>xn :NERDTreeToggle<CR>
let NERDTreeShowBookmarks = 1
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Config Rainbow parens
syntax on
let g:rainbow_active = 1
let g:rainbow_conf = {
  \ 'ctermfgs': ['red', 'green', 'blue']
  \}

" Config Scratchbuffer
let g:scratch_no_mappings = 1
let g:scratch_horizontal = 0      " Display it vertically
let g:scratch_top = 0             " Open on the left side
let g:scratch_height = 0.2
let g:scratch_insert_autohide = 0 " Don't hide when exiting insert mode
nmap <silent> <Leader>bs :ScratchInsert<CR>

" Default colorscheme
colorscheme 256_noir
