scriptencoding utf-8
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/coc.vim

" Based off of: https://github.com/ctaylo21/jarvis/tree/master/config/nvim

" ==================================================================== "
" ===                       Editing Options                        === "
" ==================================================================== "
set expandtab                       "Replace tabs with spaces
set softtabstop=4                   "<Tab> character is 4 spaces
set shiftwidth=4                    "Shifts w/ < and > by 4 spaces

" ==================================================================== "
" ===                       Visuals                                === "
" ==================================================================== "
set number                          "Turn on line numbers
set nowrap                          "Don't wrap long lines
set nocursorline                    "Don't highlight current line 

colorscheme onedark                 "Change color scheme
let g:airline_theme='onedark'       "Change airline theme (NOT WORKING)

set noshowcmd                       "Don't show previous command 
set cmdheight=1                     "Command Line only 1 tall

set clipboard=unnamed               "Use system clipboard
set hidden                          "Hide buffers instead of closing

" ==================================================================== "
" ===                       Key-Bindings                           === "
" ==================================================================== "
inoremap jk <Esc>                   "Maps 'jk' to <Esc>

