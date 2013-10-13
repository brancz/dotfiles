"
" flopska
" https://github.com/flopska/dotfiles/
"

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set ruler			" show the cursor position all the time
set number			" line numbers on

" Pathogen Plugin ausführen "
execute pathogen#infect()

let mapleader = ","

" make the window title the filename "
set title

"" Don't write Backup files "
set nobackup
set noswapfile

"" Navigate long lines easily
nnoremap j gj
nnoremap k gk

"" molokai Colorscheme
colorscheme molokai 

"" no toolbar
set guioptions=aegimrLt
