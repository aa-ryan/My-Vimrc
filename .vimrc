set nu
syntax on
set shell=/bin/zsh    "changing my shell to zsh
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
call plug#end()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['pylint','python']
let g:syntastic_python_pylint_exec = '/Users/arx6363/Library/Python/3.8/bin/pylint'  "Make sure you add your path to this line
let g:syntastic_quiet_messages = { "type": "style" }



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

let python_highlight_all = 1
let python_space_error_highlight = 0

:let mapleader = "\<Space>"

let g:airline_theme='codedark'                                   
let g:airline_powerline_fonts = 1
set guifont=Source\ Code\ Pro\ for\ Powerline:h14               

colorscheme codedark          "Using a new colorscheme codedark it is like vscode.
"set background=dark

:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl<Bar> :unlet _s <CR> 
autocmd BufWritePre *.py %s/\s\+$//e                           "This will clear all trailing whitespaces automatically 
                                                               "when you save your file


:let g:airline_section_b = '%{strftime("%H:%M")}'
map tR :call airline#extensions#stopwatch#run()<CR>. "run
map tS :call airline#extensions#stopwatch#split()<CR> "split
map tT :call airline#extensions#stopwatch#stop()<CR>  "stop                "Installed a stopwatch on Airline
map tE :call airline#extensions#stopwatch#reset()<CR>  "reset
map tY :call airline#extensions#stopwatch#summary()<CR> "summary


set nofoldenable           "currently disabled codefolding you can remove it.

if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

map <C-j> <C-W>j
map <C-k> <C-W>k              "These four lines are for navigating between currently opened windows using split screen
map <C-h> <C-W>h              "Press ctrl+j to move to window below your current window     
map <C-l> <C-W>l




