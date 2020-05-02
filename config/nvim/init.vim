scriptencoding utf-8
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/coc.vim

" Based off of: https://github.com/ctaylo21/jarvis/tree/master/config/nvim

" ==================================================================== "
" ===                       Editing Options                        === "
" ==================================================================== "
filetype indent on                  "recognize indenting for filetype

"""" Tab/indenting
set autoindent                      "Copy indent from line above
set expandtab                       "Replace tabs with spaces
set softtabstop=4                   "<Tab> character is 4 spaces
set shiftwidth=4                    "Shifts w/ < and > by 4 spaces

"""" Searching
set ignorecase                      "make search case insensitive
set smartcase                       "search case sensitive if use capital letters
set incsearch                       "incremental searching
set hlsearch                        "highlight search matches
set wildmenu                        "visual autcomplete for command menu

"""" Buffers
set clipboard=unnamed               "Use system clipboard
set hidden                          "Hide buffers instead of closing

"""" Splits
set splitbelow                      "open split underneath
set splitright                      "open split to right

" ==================================================================== "
" ===                       Visuals                                === "
" ==================================================================== "
"""" Lines
set number                          "Turn on line numbers
set nowrap                          "Don't wrap long lines
set nocursorline                    "Don't highlight current line 

"""" Themes
colorscheme onedark                 "Change color scheme
let g:airline_theme='onedark'       "Change airline theme (NOT WORKING)

"""" Command Line
set noshowcmd                       "Don't show previous command 
set cmdheight=1                     "Command Line only 1 tall

"""" Misc
set lazyredraw                      "only redraw when needed
set showmatch                       "show matching brackets

" ==================================================================== "
" ===                       Key-Bindings                           === "
" ==================================================================== "
let mapleader = "\<Space>"                 "changes leader to comma

"Maps 'jk' to <Esc> (can't be after the remap or causes errors)
inoremap jk <Esc>

"""" Normal Mode 
"colon replacements
nmap <leader>w :w<cr>
nmap <leader>wq :wq<cr>
nmap <leader>q :q<cr>

"split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"""" FZF
"Activate FZF search
nmap <leader>f :FZF<cr>
