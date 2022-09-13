if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible    "Use Vim defaults (much better!)
set bs=indent,eol,start        " allow backspacing over everything in insert mode
"set ai         "always set autoindenting on
"set backup     "keep a backup file
set viminfo='20,\"50    "read/write a .viminfo file, don't store more
            "than 50 lines of registers
set history=50      "keep 50 lines of command line history
set ruler       "show the cursor position all the time

syntax on
set hlsearch        "highlight search
set incsearch           "search as characters are entered

"TABS
set tabstop=4       "number of visual spaces per TAB
set softtabstop=4   "number of spaces in tab when editing
"set expandtab      "tabs are spaces
"""""""""
let mapleader=","       "leader is comma

set showcmd     "show command in bottom bar
set wildmenu            "visual autocomplete for command menu
set lazyredraw          "redraw only when we need to.

"FOLDING
set foldenable          " enable folding
set foldmethod=manual   " fold based on manual level

"turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
"highlight last inserted text
nnoremap gV `[v`]
"set number
nnoremap sn :set number<CR>
"set nonumber
nnoremap snn :set nonumber<CR>

filetype on
filetype plugin on

if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif
" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

"Auto load and save views
autocmd BufWinLeave * if expand("%") != "" | mkview | endif
autocmd BufWinEnter * if expand("%") != "" | loadview | endif
