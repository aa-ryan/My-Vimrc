set nu
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'tmhedberg/simpylfold'
Plug 'raimondi/delimitmate'
Plug 'davidhalter/jedi-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
call plug#end()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['pylint','pep8','python','pycodestyle','pyflakes']


set background=dark
colorscheme solarized


inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0

" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

let g:airline_theme='<theme>',
let python_highlight_all = 1
let python_space_error_highlight = 0

:let mapleader = "\<Space>"

let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
g:airline_symbols
set guifont=Source\ Code\ Pro\ for\ Powerline:h24





