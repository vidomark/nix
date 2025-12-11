""""""""""""""""""""
" General Settings "
""""""""""""""""""""
" https://github.com/JetBrains/ideavim/wiki/set-commands

" Leader key (default: Space)
let mapleader = " "

" Paste from system clipboard - https://stackoverflow.com/a/30691754
set clipboard^=unnamed,unnamedplus,ideaput

" Incremental search - searches as you type
set incsearch

" Highlight search - highlight searches
set hlsearch

" Ignores case sensitivity when searching
set ignorecase

" If you searched in all lowercase, search is NOT case sensitive.
" If it contains an uppercase, search IS case sensitive.
set smartcase

" Show current line number
set number

" Show other line's numbers RELATIVE to your current position
set relativenumber

" Minimum number of lines above and below the cursor
set scrolloff=20

" Show current mode on the status line
set showmode

" Use visual bell instead of beeping
set visualbell

" Copy indent from current line when starting a new line
set autoindent

" Nowrap on text
set nowrap

" Show (partial) command in the last line of the screen
set showcmd

" Display the current mode
set showmode

" Display the sign column
set signcolumn=yes

" Split new window to the right
set splitright

" Split new window to the left
set splitbelow

" Additional keywords
set iskeyword+=-
