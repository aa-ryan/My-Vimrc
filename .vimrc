"Setting number as well as relative numbers for ease in scrolling and selection of line.
set nu
set rnu

"Syntax enabled.
syntax enable

"By default I am using zsh shell.
set shell=/bin/zsh

"Setting the same clipboard for Vim and System.
set clipboard=unnamed

"You see suggestion for commands in Airline.
set wildmenu

"Max textwidth after 80 characters new line will began.
"You can see count Airline.
set textwidth=80


"Plugins
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'tmhedberg/simpylfold'
Plug 'raimondi/delimitmate'
Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'ffanzhang/vim-airline-stopwatch'
Plug 'tomasiser/vim-code-dark'
Plug 'yggdroot/indentline'
call plug#end()


"Shortcut to access NERDTree toggle menu.
map <C-n> :NERDTreeToggle<CR>

"Syntastic configuration
"Checkers for cpp and c are already enabled to check run :SyntasticInfo .
"OR specify the path of the gcc or make.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['pylint','python','pep8','pycodestyle']
let g:syntastic_python_pylint_exec = '/Users/arx6363/Library/Python/3.8/bin/pylint'
let g:syntastic_python_pep8_exec = '/Library/Frameworks/Python.framework/Versions/3.8/bin/pep8'
let g:syntastic_quiet_messages = { "type": "style" }



"You can't use arrows keys in vim
"Remapped ctrl+e to go to the end of the line in INSERT mode and ctrl+a to start of the line.
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

"Python highlighting
let python_highlight_all = 1
let python_space_error_highlight = 0

"This is your leader key
:let mapleader = "\<Space>"

"Airline configurations
let g:airline_theme='codedark'
let g:airline_powerline_fonts = 1
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
let g:airline#extensions#branch#enabled = 1
let g:airline_section_c = '%{strftime("%H:%M")}'


"ColorScheme is like VScode.
colorscheme codedark
"set background=dark

"Remove all trailing whitespaces by pressing F5.
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl<Bar> :unlet _s <CR>

"Automatically remove all trailing whitespaces on saving file.
autocmd BufWritePre * :%s/\s\+$//e

"StopClock for time management, See the key bindings.
map tR :call airline#extensions#stopwatch#run()<CR>. "run
map tS :call airline#extensions#stopwatch#split()<CR> "split
map tT :call airline#extensions#stopwatch#stop()<CR>  "stop
map tE :call airline#extensions#stopwatch#reset()<CR>  "reset
map tY :call airline#extensions#stopwatch#summary()<CR> "summary

"Folding by indent and folding starts at 10 lines.
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10

"Disabling that irritating ERROR bell PHEW!
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

"These mappings are for easy movements between mutiple splits in VIM.
"Ex- Press ctrl+j to go to split just below your cursor.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"This will show lines as you indent you code.
"A real life saver for me.
let g:indentLine_bgcolor_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']


"Setting directory for .backup, .swp, .undo files to location I want to.
set backupdir=.backup/,~/.backup/,/Users/arx6363/vimtemp//
set directory=.swp/,~/.swp/,/Users/arx6363/vimtemp//
set undodir=.undo/,~/.undo/,/Users/arx6363/vimtemp//

"Press F2 to execute python files.
autocmd filetype python nnoremap <buffer><F2> :w<CR>:!clear;python3 %<CR>

"Press F2 to execute javascript files.
autocmd filetype javascript nnoremap <buffer><F2> :w<CR>:!clear;node %<CR>

"Press F2 to compile and execute c and cpp files.
autocmd FileType c nnoremap <buffer> <F2> :w<CR>:!gcc -o %< % && ./%< <CR>
autocmd FileType cpp nnoremap <buffer> <F2> :w<CR>:!g++ -o %< % && ./%< <CR>

"This is for c and cpp
autocmd FileType c,cpp :set cindent
autocmd FileType c,cpp :setf c
autocmd FileType c,cpp :set expandtab

"Reload .vimrc when changes are made.
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc










