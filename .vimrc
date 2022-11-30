if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif


"GENERAL
set nocompatible               "Use Vim defaults (much better!)
syntax on
set viminfo='20,\"50           "read/write a .viminfo file, don't store more
                               "than 50 lines of registers
set history=50                 "keep 50 lines of command line history
set showcmd                    "show command in bottom bar
set wildmenu                   "visual autocomplete for command menu
set lazyredraw                 "redraw only when we need to.
filetype on
filetype plugin on
set bs=indent,eol,start        "allow backspacing over everything in insert mode
filetype indent on             "load filetype-specific indent files


"don't wake up system with blinking cursor:
let &guicursor = &guicursor . ",a:blinkon0"

"set ai                        "always set autoindenting on


"BACKUP
"delete old backup, backup current file
set backup
set writebackup


"MOVEMENT
"move vertically by visual line
nnoremap j gj
nnoremap k gk


"SEARCH
set hlsearch                   "highlight search
set incsearch                  "search as characters are entered


"TABS
set tabstop=4                  "number of visual spaces per TAB
set softtabstop=4              "number of spaces in tab when editing
"set expandtab                 "tabs are spaces


"LEADER
let mapleader=","              "leader is comma


"FOLDING
set foldenable                 "enable folding
set foldmethod=manual          "fold based on manual level


"HIGHLIGHT
"turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
"highlight last inserted text
nnoremap gV `[v`]
set ruler                      "show the cursor position all the time
set cursorline                 "highlight current line


"LINE NUMBERS
"set number
nnoremap sn :set number<CR>
"set nonumber
nnoremap snn :set nonumber<CR>

"PLUGINS

"pathogen
"https://github.com/tpope/vim-pathogen
"mkdir -p ~/.vim/autoload ~/.vim/bundle && \
"curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect()

"undotree
"git clone https://github.com/mbbill/undotree.git ~/.vim/bundle/undotree
"toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>

"nerdtree
"git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"vim-nerdtree-syntax-highlight
"git clone https://github.com/tiagofumo/vim-nerdtree-syntax-highlight ~/.vim/bundle/vim-nerdtree-syntax-highlight

"dev-icons
"git clone https://github.com/ryanoasis/vim-devicons ~/.vim/bundle/vim-devicons
"put neede font from https://github.com/ryanoasis/nerd-fonts to
"~/.local/share/fonts

"airline
"git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
"git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

"fugitive
"git clone https://tpope.io/vim/fugitive.git ~/.vim/bundle/fugitive

"flake8
"pip install flake8
"git clone https://github.com/nvie/vim-flake8.git .vim/bundle/vim-flake8
autocmd FileType python map <buffer> <leader>f :call flake8#Flake8()<CR>


"gVIM
"COLORSCHEME, FONTS
if has('gui_running')
    "colorsheme
    colorscheme solarized
    set background=light
    let g:solarized_contrast="high" | colorscheme solarized
    let g:solarized_visibility="high" | colorscheme solarized
    let g:solarized_diffmode="high" | colorscheme solarized
    nnoremap sbd :set background=dark<CR>
    nnoremap sbl :set background=light<CR>
    if has("gui_gtk3")
      set guifont=Inconsolata\ 14
    elseif has("gui_win32")
      set guifont=Consolas:h11
    "elseif has("gui_macvim")
    "  set guifont=Menlo\ Regular:h14
    endif
endif
