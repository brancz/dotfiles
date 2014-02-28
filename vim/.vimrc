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
set softtabstop=2               " enable correct backspacing
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

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

function! FeedVisualCmd(cmdpat)
    let [qr, qt] = [getreg('"'), getregtype('"')]
    silent norm! gvy
    let cmd = printf(a:cmdpat, shellescape(@"))
    call setreg('"', qr, qt)
    echo system(cmd)
    if v:shell_error
        echohl ErrorMsg | echom 'Failed to run ' . cmd | echohl NONE
    endif
endfunction

vnoremap <leader>p :<c-u>call FeedVisualCmd('"curl" --data ''{"paste":{"title":"vim-paste","content":"%s","language":""}}'' -i -H "Accept: application/json" -H "Content-Type: application/json" http://vim-pastebin.herokuapp.com/pastes.json')<cr>
"
"" no toolbar and no scrollbar
set guioptions=aegimLt
