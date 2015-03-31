set nocompatible


" Use pathogen to easily modify the runtime path to include all plugins under the ~/.vim/bundle directory
call pathogen#infect()
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()


" Change the mapleader from \ to ,
let mapleader=","


" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
" if you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden


" Miscellaneous settings
set nowrap                     " don't wrap lines
set nobackup                   " no backups, no swap files etc.
set nowritebackup              "
set noswapfile                 "

set tabstop=2                  " a tab is four spaces
set shiftwidth=2               " number of spaces to use for autoindenting
set shiftround                 " use multiple of shiftwidth when indenting with '<' and '>'

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent                 " always set autoindenting on
set copyindent                 " copy the previous indentation on autoindenting
set number                     " always show line numbers
set showmatch                  " set show matching parenthesis
set ruler                      " always show the info ruler at the bottom
set cursorline                 " highlight the current line
set visualbell                 " disable beeps on mistype

set encoding=utf-8             " UTF encoding
set autoread                   " autoload files that have changed outside of vim

set ignorecase                 " ignore case when searching
set smartcase                  " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                   " insert tabs on the start of a line according to shiftwidth, not tabstop
set wildmenu                   " visual autocomplete for command menu (e.g. :e ~/path/to/file)

set hlsearch                   " highlight search terms
set incsearch                  " show search matches as you type


" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·


" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100


" Use system clipboard
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed


" Mouse stuff
set ttyfast					   " send more characters for redraws
set mouse=a                    " enable mouse use in all modes
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2


" Remappings
map <Leader>n <plug>NERDTreeTabsToggle<CR>
vnoremap // y/<C-R>"<CR>       " allow searching for selected text by typing // in visual mode


" Airline...
set laststatus=2
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


" Finally...
syntax on
filetype plugin indent on
set t_Co=256
"colorscheme Dark2


" Auto-load nerdtree
"autocmd VimEnter * NERDTree | wincmd p
let g:nerdtree_tabs_open_on_console_startup = 1
let NERDTreeShowBookmarks = 1
