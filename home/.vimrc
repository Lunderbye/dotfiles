set nocompatible		" Be iMproved, required
filetype off			" Required
syntax on			" Turn on syntax highlighting
filetype plugin indent on	" For plugins to load correctly
set modelines=0			" Security
set number			" Show line numbers
set ruler			" Show file stats
set encoding=utf-8		" Set encoding
set hidden			" Allow hidden buffers
set path+=**			" Fuzzy search
set wildmenu			" Display all matching files when we tab complete

syntax enable
set t_Co=256

" Use colorscheme from https://github.com/gruvbox-material/vim
set termguicolors		" important!!
set background=dark		" for dark version

" set contrast
" this configuration option should be placed before `colorscheme gruvbox-material`
" available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material

" Enable airline color scheme
let g:airline_theme = 'gruvbox_material'
