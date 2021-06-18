set nu
set rnu
set history=10000
set shell=/bin/bash
set tabstop=4
set shiftwidth=4
set splitright
set confirm
set showbreak=↪
set incsearch
set showcmd
set cmdheight=2
set guifont=Hack\ Nerd\ Font:h16
set path+=\Desktop\**

if has('vim_starting')
	if &compatible
		set nocompatible
	endif
endif

"Syntax enabled.
syntax on
filetype plugin indent on

"You see suggestion for commands in Airline.
set wildmenu


"This is your leader key
let mapleader = "\<Space>"

"Disabling that irritating ERROR bell PHEW!
if has("gui_macvim")
	autocmd GUIEnter * set vb t_vb=
endif

set undofile
"Setting directory for .backup, .swp, .undo files to location I want to.
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//



call plug#begin()
Plug 'francoiscabrol/ranger.vim'
" Plug 'zxqfl/tabnine-vim'
" Plug 'tpope/vim-commentary'
" Plug 'luochen1990/rainbow'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'SirVer/ultisnips'
" Plug 'tpope/vim-surround'
" Plug 'yggdroot/indentline'
" Plug 'jiangmiao/auto-pairs'
" Plug 'honza/vim-snippets'
call plug#end()


"NETRW
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
"Trailing whitespaces
"
"Automatically remove all trailing whitespaces on saving file.
autocmd BufWritePre * :%s/\s\+$//e

"These mappings are for easy movements between mutiple splits in VIM.
"Ex- Press ctrl+j to go to split just below your cursor.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Remapped ctrl+e to go to the end of the line in INSERT mode and ctrl+a to start of the line.
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0

" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"indentLine settings for terminal and gui
" autocmd! User indentLine doautocmd indentLine Syntax

"Rainbow Brackets plugin
" let g:rainbow_active = 1


nnoremap ,cpp :-1read $HOME/.vim/skeleton/skel.cpp<CR>9j3wa<CR><ESC>O
nmap <leader>t :vert term<CR>
"This is for c and cpp
autocmd FileType c,cpp :set cindent
autocmd FileType c,cpp :setf c
autocmd FileType c,cpp :set expandtab




" Compiling and execution

if filereadable("Makefile")
        set makeprg=make\ -s
    else
        " autocmd FileType java       set makeprg=javac\ %
        " autocmd FileType scala      set makeprg=scalac\ %
        " autocmd FileType haskell    set makeprg=ghc\ -o\ %<\ %
        " autocmd FileType javascript set makeprg=echo\ OK
        autocmd FileType python     set makeprg=python3\ %
        " autocmd FileType perl       set makeprg=echo\ OK
        autocmd FileType c          set makeprg=gcc\ -o\ %<\ %
        autocmd FileType cpp        set makeprg=g++\ -g\ -O2\ --std=c++17\ -o\ %<\ %
		autocmd FileType vhdl       set makeprg=ghdl\ -s\ %
    endif

                                " nmap <F8> <ESC>:w<CR><ESC>:!./%<CR>
                                " imap <F8> <ESC>:w<CR><ESC>:!./%<CR>
    autocmd FileType c          nmap {[ <ESC>:w<CR><ESC>:vert term ./%<<CR>
    " autocmd FileType c          imap {[ <ESC>:w<CR><ESC>:vert term ./%<<CR>
    autocmd FileType cpp        nmap {[ <ESC>:w<CR><ESC>:vert term ./%<<CR>
    " autocmd FileType cpp        imap {[ <ESC>:w<CR><ESC>:vert term ./%<<CR>
    " autocmd FileType java       nmap {[ <ESC>:w<CR><ESC>:!java %<<CR>
    " autocmd FileType java       imap {[ <ESC>:w<CR><ESC>:!java %<<CR>
    " autocmd FileType scala      nmap {[ <ESC>:w<CR><ESC>:!scala %<<CR>
    " autocmd FileType scala      imap {[ <ESC>:w<CR><ESC>:!scala %<<CR>
    " autocmd FileType haskell    nmap {[ <ESC>:w<CR><ESC>:!./%<<CR>
    " autocmd FileType haskell    imap {[ <ESC>:w<CR><ESC>:!./%<<CR>
    autocmd FileType python     nmap {[ <ESC>:w<CR><ESC>:vert term python3 %<CR>
    " autocmd FileType python     imap {[ <ESC>:w<CR><ESC>:vert term python3 %<CR>
    " autocmd FileType perl       nmap {[ <ESC>:w<CR><ESC>:!perl %<CR>
    " autocmd FileType perl       imap {[ <ESC>:w<CR><ESC>:!perl %<CR>

    " imap {{ <ESC>:w<CR><ESC>:make<CR>:cwindow<CR><CR>
    nmap {{ <ESC>:w<CR><ESC>:make<CR>:cwindow<CR><CR>

	" imap {] <ESC>:w<CR><ESC>:silent make<CR>:call feedkeys("\<F4>")<CR>
    nmap {]  <ESC>:w<CR><ESC>:silent make<CR>:call feedkeys("\{[")<CR>


"fzf.vim-------------------maps and uses----------------------

""Leader+L for line search in the current file.
"nnoremap <silent> <Leader>L   :BLines<CR>
""Leader+B for buffer search.
"nnoremap <silent> <Leader>B  :Buffers<CR>
"nnoremap <silent> <Leader>b  :bn<CR>
""Leader+ff+Enter for file search.
"nnoremap <silent> ff :Files

"command! -bang DesktopFiles call fzf#vim#files('~/Desktop/', <bang>0)
"nmap <Leader>_ :DesktopFiles<CR>


"let g:fzf_history_dir = '/Users/arx6363/tmp_vim/skim_his'
"let g:fzf_files_options =
"			\ '--preview "(coderay {} || bat {}) 2> /dev/null | head -'.&lines.'"'
"let g:fzf_layout = {'window' : {'width' : 0.8, 'height' : 0.8}}

"" Mapping selecting mappings
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-l> <plug>(fzf-complete-line)

"augroup resume_edit_position
"	autocmd!
"	autocmd BufReadPost *
"				\ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
"				\ | execute "normal! g`\"zvzz"
"				\ | endif
"augroup END


"command! -nargs=* -complete=dir Cd call fzf#run(fzf#wrap(
"			\ {'source': 'find '.(empty(<f-args>)? '.' : <f-args>).' -type d',
"			\  'sink': 'cd'}))

"let g:UltiSnipsExpandTrigger= '<tab>'
"let g:UltiSnipsJumpForwardTrigger='<C-j>'
"let g:UltiSnipsJumpBackwardTrigger='<C-k>'
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

set laststatus=2
"hi statusline       guibg=blue   guifg=white "If using terminal comment out these two lines.
"hi LineNr guibg=NONE guifg=green


" Formats the statusline
let g:currentmode={
			\ 'n'  : 'NORMAL ',
			\ 'v'  : 'VISUAL ',
			\ 'V'  : 'V·Line ',
			\ '' : 'V·Block ',
			\ 'i'  : 'INSERT ',
			\ 'R'  : 'Replace',
			\ 'Rv' : 'V·Replace ',
			\ 'c'  : 'Command ',
			\ 't'  : 'Terminal',
			\ 's'  : 'Snippet',
			\}

set statusline=
" Show current mode
set statusline+=\ \ %{toupper(g:currentmode[mode()])}
" set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=[%{&ff}]\ \                       "file format
set statusline+=%f\ \ [
set statusline+=%{strftime('%H:%M')}]


set statusline+=\ %=                            " align left

set statusline+=%h                               "help file flag

set statusline+=%y\                                "filetype
set statusline+=Line:%l/%L\ [%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor

colorscheme koehler
" if strftime("%H:%M") > '16:00'
" else
  " colorscheme darkblue
" endif
hi Cursor gui=reverse guibg=NONE guifg=NONE
hi Visual gui=reverse guibg=NONE guifg=NONE
