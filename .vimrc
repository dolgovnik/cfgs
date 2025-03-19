if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif


"GENERAL
set nocompatible               "Use Vim defaults (much better!)
set viminfo='20,\"50           "read/write a .viminfo file, don't store more
                               "than 50 lines of registers
set showcmd                    "show command in bottom bar
set wildmenu                   "visual autocomplete for command menu
set lazyredraw                 "redraw only when we need to.
set autochdir                  "auto change workdir to current opened file
filetype on
filetype plugin on
set bs=indent,eol,start        "allow backspacing over everything in insert mode
"filetype indent on             "load filetype-specific indent files
set number

"SYNTAX
syntax on
au BufReadPost *.ci set syntax=groovy

"FOLDING
"all folds are open by default
set foldlevel=99
"folding file types
autocmd FileType go setlocal foldmethod=syntax
autocmd FileType python setlocal foldmethod=syntax

"decimal number format
set nrformats=

"don't wake up system with blinking cursor:
let &guicursor = &guicursor . ",a:blinkon0"

"set ai                        "always set autoindenting on

"COMMAND HISTORY
set history=50                 "keep 50 lines of command line history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

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
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeWinSize=50
"set ambiwidth=double  "to not slice dev_icons in nerdtee


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


"preview-uml
"git clone https://github.com/skanehira/preview-uml.vim ~/.vim/bundle/preview-uml
"docker run -d -p 8888:8080 plantuml/plantuml-server:jetty
let g:preview_uml_url='http://localhost:8888'


"fugitive
"git clone https://tpope.io/vim/fugitive.git ~/.vim/bundle/fugitive


"ALE
"git clone https://github.com/dense-analysis/ale ~/.vim/bundle/ale
"ALE: Python libs installation
"python3.11 -m pip install flake8
"python3.11 -m pip install pylint
"python3.11 -m pip install pylint-pydantic
"python3.11 -m pip install pylint-report
"python3.11 -m pip install mypy
"install python-lsp-server, check dependecies
"python3.11 -m pip install "python-lsp-server[rope]"
"python3.11 -m pip install jedi==0.19.1
"python3.11 -m pip install 'parso>=0.8'
"ALE: Go libs installation
"go get golang.org/x/tools/gopls@latest
"ALE: linters
let g:ale_linters = {'python': ['flake8', 'pylint', 'mypy', 'pylsp'], 'go': ['gopls']}
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 1
let g:ale_virtualenv_dir_names = ['.venv', 'env', 've', 'venv', 'virtualenv', '.env']
"ALE: message formats
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%][%severity%] %s'
let g:ale_virtualtext_prefix = '%comment% [%linter%][%severity%] '
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
"ALE: function to change ALE colours
function! ALEColours() abort
	highlight link ALEVirtualTextError Error
"    highlight link ALEVirtualTextWarning Warning
    highlight ALEVirtualTextWarning guibg=yellow guifg=black ctermbg=yellow ctermfg=black
"	highlight link ALEVirtualTextInfo Info
	highlight ALEVirtualTextInfo guibg=green guifg=black ctermbg=green ctermfg=black
endfunction
"ALE:use ALE colours in any GUI colouscheme
augroup MyALEColors
    autocmd!
    autocmd ColorScheme * call ALEColours()
augroup END
"ALE: arirline support
let g:airline#extensions#ale#enabled = 1
"ALE: Python configuration
"ALE: flake8 configuration
call ale#Set('python_flake8_options', '--config=$HOME/.flake8')
"ALE: pylsp configuration
let g:ale_python_pylsp_config = {'pylsp':{'plugins':{'pycodestyle':{'enabled': v:false}}}}
"ALE: mypy configuration
let g:ale_python_mypy_ignore_invalid_syntax = 1
let g:ale_python_mypy_options = '--config-file $HOME/.mypy.ini'
"ALE: GO configuration
let g:ale_go_gopls_init_options = {'buildFlags': ["-tags=ybts"]}
"let g:ale_go_gopls_init_options = {'buildFlags': ["-tags=ybsc"]}
"let g:ale_go_go111module = 'off'
"ALE: hover settings
set updatetime=500            "user doesn't press a key for the time - hover start work
"ALE: key mapings
nnoremap <leader>d :ALEGoToDefinition -vsplit<CR>
nnoremap <leader>dt :ALEGoToDefinition -tab<CR>
nnoremap <leader>t :ALEGoToTypeDefinition -vsplit<CR>
nnoremap <leader>tt :ALEGoToTypeDefinition -tab<CR>
nnoremap <leader>i :ALEGoToImplementation -vsplit<CR>
nnoremap <leader>it :ALEGoToImplementation -tab<CR>
nnoremap <leader>f :ALEFindReferences -relative<CR>
nnoremap <leader>h :ALEHover<CR>
nnoremap <leader>s :ALESymbolSearch 


"vimwiki
"git clone https://github.com/vimwiki/vimwiki.git
"vimwiki help
"vim -c 'helptags ~/.vim/bundle/vimwiki/doc/' -c quit
let wiki_1 = {}
let wiki_1.name = 'Work'
let wiki_1.path = '~/wiki/work/'
let wiki_1.path_html = '~/wiki/work/html/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

let wiki_2 = {}
let wiki_2.name = 'Study'
let wiki_2.path = '~/wiki/study/'
let wiki_2.path_html = '~/wiki/study/html/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'

let wiki_3 = {}
let wiki_3.name = 'Personal'
let wiki_3.path = '~/wiki/personal/'
let wiki_3.path_html = '~/wiki/personal/html/'
let wiki_3.syntax = 'markdown'
let wiki_3.ext = '.md'

let g:vimwiki_ext2syntax = {'.md': 'markdown'}

let g:vimwiki_list = [wiki_1, wiki_2, wiki_3]

nnoremap <Leader>vs :VimwikiVSplitLink<CR>


"gVIM
"COLORSCHEME, FONTS
"git clone https://github.com/flazz/vim-colorschemes.git ~/.vim/bundle/colorschemes
"git clone https://github.com/xolox/vim-colorscheme-switcher ~/.vim/bundle/colorschemes-switcher
"git clone https://github.com/xolox/vim-misc ~/.vim/bundle/vim-misc
nnoremap <leader>c :colorscheme<CR>
nnoremap <leader>cc :colorscheme 
nnoremap <leader>bl :set background=light<CR>
nnoremap <leader>bd :set background=dark<CR>

if has('gui_running')
    "colorsheme
    colorscheme PaperColor
    set background=light
    if has("gui_gtk3")
      set guifont=Inconsolata\ 11
    elseif has("gui_win32")
      set guifont=Consolas:h11
    "elseif has("gui_macvim")
    "  set guifont=Menlo\ Regular:h14
    endif
else
    "ALE: use ALE colours in any Termiinal
	call ALEColours()
    colorscheme PaperColor
endif
