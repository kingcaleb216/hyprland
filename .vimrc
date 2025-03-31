" --- Interface and Usability ---
set number                " Show line numbers
set relativenumber        " (Optional) Show relative line numbers too
syntax on                 " Enable syntax highlighting
set showcmd               " Show incomplete commands
set showmode              " Show mode (insert, visual, etc.)
set ruler                 " Show cursor position
set title                 " Show file name in terminal title bar
nnoremap <space>r :set relativenumber!<CR> " Toggle relative line numbers

" --- Indentation and Tabs ---
set expandtab             " Use spaces instead of tabs
set tabstop=3             " Tabs are 3 spaces
set shiftwidth=3          " Indentation levels are 3 spaces
set softtabstop=3         " When editing, use 3 spaces per tab
set autoindent            " Maintain indent of current line
set smartindent           " Smarter auto-indent on new lines

" --- Searching ---
set ignorecase            " Case-insensitive search...
set smartcase             " ...unless uppercase is used
set incsearch             " Incremental search
set hlsearch              " Highlight matches
nnoremap <space> :noh<CR> " Clear search highlight with Spacebar

" --- Completion ---
set wildmenu              " Show options as a menu (autocomplete for commands)
set wildmode=longest:full,full
set completeopt=menuone,noselect " Better completion behavior for insert mode

" --- File Handling ---
set hidden                " Allow switching buffers without saving
set autoread              " Auto-reload file if changed outside Vim
set undofile              " Persistent undo across sessions

" --- Clipboard (if supported) ---
set clipboard=unnamedplus " Use system clipboard (requires +clipboard build)

" --- Mouse Support (optional) ---
set mouse=a               " Enable mouse support in all modes

" --- Status Line ---
set laststatus=2          " Always show the status line
set cmdheight=1           " Height of command line area

" --- Better Backspace Behavior ---
set backspace=indent,eol,start

" --- File Encoding ---
set encoding=utf-8
set fileencoding=utf-8

