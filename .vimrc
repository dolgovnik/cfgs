if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif


"GENERAL
set nocompatible               "Use Vim defaults (much better!)
set viminfo='20,\"50           "read/write a .viminfo file, don't store more
                               "than 50 lines of registers
set history=50                 "keep 50 lines of command line history
set showcmd                    "show command in bottom bar
set wildmenu                   "visual autocomplete for command menu
set lazyredraw                 "redraw only when we need to.
set autochdir                  "auto change workdir to current opened file
filetype on
filetype plugin on
set bs=indent,eol,start        "allow backspacing over everything in insert mode
filetype indent on             "load filetype-specific indent files
set number


"SYNTAX
syntax on
au BufReadPost *.ci set syntax=groovy


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
" set ambiwidth=double  "to not slice dev_icons in nerdtee

"vim-nerdtree-syntax-highlight
"git clone https://github.com/tiagofumo/vim-nerdtree-syntax-highlight ~/.vim/bundle/vim-nerdtree-syntax-highlight

"dev-icons
"git clone https://github.com/ryanoasis/vim-devicons ~/.vim/bundle/vim-devicons
"put needed font (All Ubuntu Fonts) from https://github.com/ryanoasis/nerd-fonts to
"~/.local/share/fonts

"airline
"git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
"git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
"sudo apt-get install fonts-powerline
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

"fugitive
"git clone https://tpope.io/vim/fugitive.git ~/.vim/bundle/fugitive

"ALE
"git clone https://github.com/dense-analysis/ale ~/.vim/bundle/ale
"python3.11 -m pip install flake8
"python3.11 -m pip install pylint
"python3.11 -m pip install pylint-pydantic
"python3.11 -m pip install pylint-report
"python3.11 -m pip install mypy
"install python-lsp-server, check dependecies
"python3.11 -m pip install "python-lsp-server[rope]"
"python3.11 -m pip install jedi==0.19.1
"python3.11 -m pip install 'parso>=0.8'
let g:ale_linters = {'python': ['flake8', 'pylint', 'mypy', 'pylsp'], 'go': ['govet', 'gopls']}
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 1
let g:ale_virtualenv_dir_names = ['.venv', 'env', 've', 'venv', 'virtualenv', '.env']
"ALE arirline support
let g:airline#extensions#ale#enabled = 1
"ALE flake8 configuration
call ale#Set('python_flake8_options', '--config=$HOME/.flake8')
"ALE mypy configuration
let g:ale_python_mypy_ignore_invalid_syntax = 1
let g:ale_python_mypy_options = '--config-file ~/.mypy.ini'
"ALE GO configuration
let g:ale_go_go111module = 'off'
"ALE hover settings
set updatetime=500            "user doesn't press a key for the time - hover start work
"ALE key mapings
nnoremap <leader>d :ALEGoToDefinition -vsplit<CR>
nnoremap <leader>dt :ALEGoToDefinition -tab<CR>
nnoremap <leader>t :ALEGoToTypeDefinition -split<CR>
nnoremap <leader>i :ALEGoToImplementation -vsplit<CR>
nnoremap <leader>f :ALEFindReferences -relative<CR>
nnoremap <leader>h :ALEHover<CR>

"gVIM
"COLORSCHEME, FONTS
"git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
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
      set guifont=Inconsolata\ 11
    elseif has("gui_win32")
      set guifont=Consolas:h11
    "elseif has("gui_macvim")
    "  set guifont=Menlo\ Regular:h14
    endif
endif
