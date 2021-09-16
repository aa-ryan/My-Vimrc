set nu
set mouse=a
set rnu
set updatetime=300
set history=10000
"set shell=/bin/bash
set tabstop=4
set shiftwidth=4
set splitright
set confirm
set showbreak=↪
set incsearch
set showcmd
set cmdheight=2
set guifont=Hack\ Nerd\ Font:h16
set ttimeoutlen=100
set ignorecase
set omnifunc=syntaxcomplete#Complete
set completeopt+=popup
set nocompatible
set wildignore=*.class

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
nnoremap {w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'luochen1990/rainbow'
Plug 'srcery-colors/srcery-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"colorschemes      ---------------------------------
Plug 'whatyouhide/vim-gotham'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'nightsense/cosmic_latte'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'kaicataldo/material.vim'
Plug 'nightsense/stellarized'
Plug 'nanotech/jellybeans.vim'
Plug 'jnurmine/zenburn'
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

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"indentLine settings for terminal and gui
autocmd! User indentLine doautocmd indentLine Syntax

"Rainbow Brackets plugin
let g:rainbow_active = 1


nnoremap ,cpp :-1read $HOME/.vim/skeleton/skel.cpp<CR>9j3wa<CR><ESC>O
nmap <leader>t :vert term<CR>
"This is for c and cpp
autocmd FileType c,cpp :set cindent
autocmd FileType c,cpp :setf c
autocmd FileType c,cpp :set expandtab


"fzf.vim-------------------maps and uses----------------------
""Leader+L for line search in the current file.
nnoremap <silent> <Leader>L   :BLines<CR>
""Leader+B for buffer search.
nnoremap <silent> <Leader>B  :Buffers<CR>
nnoremap <silent> <Leader>b  :bn<CR>
""Leader+ff+Enter for file search.
nnoremap <silent> ff :Files

"command! -bang DesktopFiles call fzf#vim#files('~/Desktop/', <bang>0)
"nmap <Leader>_ :DesktopFiles<CR>


let g:fzf_history_dir = '/Users/arx6363/tmp_vim/skim_his'
let g:fzf_files_options =
			\ '--preview "(coderay {} || bat {}) 2> /dev/null | head -'.&lines.'"'
let g:fzf_layout = {'window' : {'width' : 0.8, 'height' : 0.8}}

"" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-l> <plug>(fzf-complete-line)
"
"augroup resume_edit_position
	autocmd!
	autocmd BufReadPost *
				\ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
				\ | execute "normal! g`\"zvzz"
				\ | endif
augroup END


command! -nargs=* -complete=dir Cd call fzf#run(fzf#wrap(
			\ {'source': 'find '.(empty(<f-args>)? '.' : <f-args>).' -type d',
			\  'sink': 'cd'}))

let g:UltiSnipsExpandTrigger= '<tab>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

"" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


colorscheme material
let g:material_terminal_italics = 1
command! AirlineThemes call fzf#run({
			\ 'source':  map(split(globpath(&rtp, 'autoload/airline/themes/*.vim'), "\n"),
			\               "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
			\ 'sink':    'AirlineTheme',
			\ 'options': '+m --prompt="Airline Themes> "',
			\ 'down':    '~40%'
			\})
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''

" let &t_SI = "\e[3 q"
" let &t_EI = "\e[3 q"

function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunction

nmap <silent> gd :call <SID>GoToDefinition()<CR>
" au Filetype markdown,c,cpp let b:autopairs_loaded=1

" Copy to system clipboard
noremap <leader>c "*yy<cr>


" Compiling and execution

if filereadable("Makefile")
        set makeprg=make\ -s
    else
        autocmd FileType java       set makeprg=javac\ %
        " autocmd FileType scala      set makeprg=scalac\ %
        " autocmd FileType haskell    set makeprg=ghc\ -o\ %<\ %
        " autocmd FileType javascript set makeprg=echo\ OK
        autocmd FileType python     set makeprg=python3\ %
        " autocmd FileType perl       set makeprg=echo\ OK
        autocmd FileType c          set makeprg=gcc\ -o\ %<\ %
        autocmd FileType cpp        set makeprg=g++\ --std=c++17\ -o\ %<\ %
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
    " " autocmd FileType scala      nmap {[ <ESC>:w<CR><ESC>:!scala %<<CR>
    " autocmd FileType scala      imap {[ <ESC>:w<CR><ESC>:!scala %<<CR>
    " autocmd FileType haskell    nmap {[ <ESC>:w<CR><ESC>:!./%<<CR> autocmd FileType haskell    imap {[ <ESC>:w<CR><ESC>:!./%<<CR> autocmd FileType python     nmap {[ <ESC>:w<CR><ESC>:vert term python3 %<CR>
    " autocmd FileType python     imap {[ <ESC>:w<CR><ESC>:vert term python3 %<CR>
    " autocmd FileType perl       nmap {[ <ESC>:w<CR><ESC>:!perl %<CR>
    " autocmd FileType perl       imap {[ <ESC>:w<CR><ESC>:!perl %<CR>

    " imap {{ <ESC>:w<CR><ESC>:make<CR>:cwindow<CR><CR>
    nmap {{ <ESC>:w<CR><ESC>:make<CR>:cwindow<CR><CR>

	" imap {] <ESC>:w<CR><ESC>:silent make<CR>:call feedkeys("\<F4>")<CR>
    nmap {]  <ESC>:w<CR><ESC>:silent make<CR>:call feedkeys("\{[")<CR>



