"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set t_Co=256

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2
set shiftwidth=2      " a tab is two spaces (or set this to 4)
set softtabstop=2               " enable correct backspacing
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

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
