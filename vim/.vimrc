set nocompatible


" Use pathogen to easily modify the runtime path to include all plugins under the ~/.vim/bundle directory
call pathogen#infect()
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()


" Change the mapleader from \ to ,
let mapleader=","


" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


" Hide open buffers when switching to another file
set hidden


" Miscellaneous settings
set nowrap                     " don't wrap lines
set noswapfile                 " don't create swapfiles

set tabstop=2                  " a tab is four spaces
set shiftwidth=2               " number of spaces to use for autoindenting
set shiftround                 " use multiple of shiftwidth when indenting with '<' and '>'

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent                 " always set autoindenting on
set copyindent                 " copy the previous indentation on autoindenting
set number                     " always show line numbers
set showmatch                  " set show matching parenthesis

set ignorecase                 " ignore case when searching
set smartcase                  " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                   " insert tabs on the start of a line according to shiftwidth, not tabstop

set hlsearch                   " highlight search terms
set incsearch                  " show search matches as you type


" Mouse stuff
set ttyfast					   " send more characters for redraws
set mouse=a                    " enable mouse use in all modes
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2


" Remappings
map <Leader>n <plug>NERDTreeTabsToggle<CR>
vnoremap // y/<C-R>"<CR>       " allow searching for selected text by typing // in visual mode


" Finally...
syntax on
filetype plugin indent on
"colorscheme xoria256


" Auto-load nerdtree
autocmd VimEnter * NERDTree | wincmd p
let NERDTreeShowBookmarks=1
