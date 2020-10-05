"BASIC SETTINGS
"Setting number as well as relative numbers for ease in scrolling and selection of line.
set nu
" set shell=/bin/bash
set rnu
set history=1000
set tabstop=4
set shiftwidth=4
set t_Co=256
set splitright
set confirm
set showbreak=↪
set cursorline
set incsearch
set ignorecase
set showcmd
set foldcolumn=2


if has('vim_starting')
	if &compatible
		set nocompatible
	endif
endif

"Syntax enabled.
syntax on
filetype plugin indent on

"Code Folding
set foldenable
set foldmethod=manual
set foldlevelstart=10
set foldnestmax=100

autocmd BufWinLeave .* mkview
autocmd BufWinEnter .* silent loadview

"Setting the same clipboard for Vim and System.
"set clipboard=unnamed

"You see suggestion for commands in Airline.
set wildmenu

"Max textwidth after 80 characters new line will began.
"You can see count Airline.
set textwidth=79

"This is your leader key
:let mapleader = "\<Space>"

"Disabling that irritating ERROR bell PHEW!
if has("gui_macvim")
	autocmd GUIEnter * set vb t_vb=
endif

"Setting directory for .backup, .swp, .undo files to location I want to.
set backupdir=.backup/,~/.backup/,/Users/arx6363/vimtemp//
set directory=.swp/,~/.swp/,/Users/arx6363/vimtemp//
set undodir=.undo/,~/.undo/,/Users/arx6363/vimtemp//

"Plugins
call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'luochen1990/rainbow'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'

"colorschemes      ---------------------------------
Plug 'whatyouhide/vim-gotham'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'nightsense/cosmic_latte'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'kaicataldo/material.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'nightsense/stellarized'
Plug 'nanotech/jellybeans.vim'
Plug 'jnurmine/zenburn'
call plug#end()

"ColorScheme
colorscheme dracula
set background=dark

let g:material_theme_style = 'default' "| 'palenight' | 'ocean' | 'lighter' | 'darker'

"ColorScheme Setup
let g:gruvbox_contrast_dark = 'dark'
let g:seoul256_background = 235
let g:seoul256_light_background = 253
let g:AutoPairsMapBS = 1
let g:vim_markdown_conceal = 0

"NETRW
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
"Trailing whitespaces
"Remove all trailing whitespaces by pressing F5.
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl<Bar> :unlet _s <CR>

"Automatically remove all trailing whitespaces on saving file.
autocmd BufWritePre * :%s/\s\+$//e


autocmd CursorHold * silent call CocActionAsync('highlight')

"These mappings are for easy movements between mutiple splits in VIM.
"Ex- Press ctrl+j to go to split just below your cursor.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Remapped ctrl+e to go to the end of the line in INSERT mode and ctrl+a to start of the line.
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0

"This will show lines as you indent you code.
"A real life saver for me.
"let g:indentLine_bgcolor_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"indentLine settings for terminal and gui
autocmd! User indentLine doautocmd indentLine Syntax
"let g:indentLine_color_term = 'yellow'
"let g:indentLine_color_gui = 'yellow'

"Use of python's virtual envoirments.
let g:virtualenv_directory = '/Users/arx6363/.venvs'

"Rainbow Brackets plugin
let g:rainbow_active = 1

"Airline configurations
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol='✘'
let g:airline#extensions#coc#warning_symbol='⚠'
let g:airline#extensions#tabline#enabled = 1


if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_section_c = '%{strftime("%H:%M")}'

"StopClock for time management, See the key bindings.
map tR :call airline#extensions#stopwatch#run()<CR>. "run
map tS :call airline#extensions#stopwatch#split()<CR> "split
map tT :call airline#extensions#stopwatch#stop()<CR>  "stop
map tE :call airline#extensions#stopwatch#reset()<CR>  "reset
map tY :call airline#extensions#stopwatch#summary()<CR> "summary


"Execution of programs
"Press F2 to execute python files.
"autocmd FileType python nmap <F2> :w<CR> :term python3 %<CR>
""Your error and warnings.
"nmap <F3> :CocDiagnostic<CR>


""Press F2 to execute javascript files.
"autocmd filetype javascript nnoremap <buffer><F2> :w<CR>:!clear;node %<CR>

""Press F2 to compile and execute c and cpp files.
""autocmd FileType c nnoremap <buffer> <F2> :w<CR>:!gcc -o %< % && ./%< <CR>
""autocmd FileType cpp nnoremap <buffer> <F2> :w<CR>:!g++ -o %< % && ./%< <CR>
""au FileType c,cpp nnoremap <buffer> <F6> :w<CR> :make %<<CR>
""au FileType c,cpp nnoremap <buffer> <F7> :vsp<CR> :term ./%<<CR>
" au FileType c nnoremap <buffer> <F2> :w<CR> :make %<<CR> :term ./%<<CR>
"autocmd FileType cpp nmap <buffer> <F2> :w <CR>:!g++ --std=c++17 % -o %< <CR> :term ./%<<CR>


nnoremap ,cpp :-1read $HOME/.vim/skeleton/skel.cpp<CR>7jo
"This is for c and cpp
autocmd FileType c,cpp :set cindent
autocmd FileType c,cpp :setf c
autocmd FileType c,cpp :set expandtab

"Reload .vimrc when changes are made.
autocmd bufwritepost .vimrc source $MYVIMRC


" Compiling and execution

if filereadable("Makefile")
        set makeprg=make\ -s
    else
        autocmd FileType java       set makeprg=javac\ %
        autocmd FileType scala      set makeprg=scalac\ %
        autocmd FileType haskell    set makeprg=ghc\ -o\ %<\ %
        autocmd FileType javascript set makeprg=echo\ OK
        autocmd FileType python     set makeprg=echo\ OK
        autocmd FileType perl       set makeprg=echo\ OK
        autocmd FileType c          set makeprg=gcc\ -o\ %<\ %
        autocmd FileType cpp        set makeprg=g++\ --std=c++17\ -o\ %<\ %
    endif

                                " nmap <F8> <ESC>:w<CR><ESC>:!./%<CR>
                                " imap <F8> <ESC>:w<CR><ESC>:!./%<CR>
    autocmd FileType c          nmap <F4> <ESC>:w<CR><ESC>:term ./%<<CR>
    autocmd FileType c          imap <F4> <ESC>:w<CR><ESC>:term ./%<<CR>
    autocmd FileType cpp        nmap <F4> <ESC>:w<CR><ESC>:term ./%<<CR>
    autocmd FileType cpp        imap <F4> <ESC>:w<CR><ESC>:term ./%<<CR>
    autocmd FileType java       nmap <F4> <ESC>:w<CR><ESC>:!java %<<CR>
    autocmd FileType java       imap <F4> <ESC>:w<CR><ESC>:!java %<<CR>
    autocmd FileType scala      nmap <F4> <ESC>:w<CR><ESC>:!scala %<<CR>
    autocmd FileType scala      imap <F4> <ESC>:w<CR><ESC>:!scala %<<CR>
    autocmd FileType haskell    nmap <F4> <ESC>:w<CR><ESC>:!./%<<CR>
    autocmd FileType haskell    imap <F4> <ESC>:w<CR><ESC>:!./%<<CR>
    autocmd FileType python     nmap <F4> <ESC>:w<CR><ESC>:!python3 %<CR>
    autocmd FileType python     imap <F4> <ESC>:w<CR><ESC>:!python3 %<CR>
    autocmd FileType perl       nmap <F4> <ESC>:w<CR><ESC>:!perl %<CR>
    autocmd FileType perl       imap <F4> <ESC>:w<CR><ESC>:!perl %<CR>

    imap <F3> <ESC>:w<CR><ESC>:make<CR>
    nmap <F3> <ESC>:w<CR><ESC>:make<CR>

    imap <F2> <ESC>:w<CR><ESC>:silent make<CR>:call feedkeys("\<F4>")<CR>
    nmap <F2> <ESC>:w<CR><ESC>:silent make<CR>:call feedkeys("\<F4>")<CR>

    " F2 to compile and run :copen for errors
    " <F3> for compiling only
    " F4 to run file pre-existing binary


""""""""From here is the start for coc.nvim plugin.""""""""""


" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=750

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use ctrl+space in insert mode to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `ne` (next-error) and `pe` (previous-error) to navigate diagnostics(ERROR and Warnings)
nmap <silent> ne <Plug>(coc-diagnostic-prev)
nmap <silent> pe <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""END""""""""""""""""""""""""""""""'
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)



"Press F8 to change colorscheme---------------------------------
function! s:colors(...)
	return filter(map(filter(split(globpath(&rtp, 'colors/*.vim'), "\n"),
				\                  'v:val !~ "^/usr/"'),
				\           'fnamemodify(v:val, ":t:r")'),
				\       '!a:0 || stridx(v:val, a:1) >= 0')
endfunction

function! s:rotate_colors()
	if !exists('s:colors')
		let s:colors = s:colors()
	endif
	let name = remove(s:colors, 0)
	call add(s:colors, name)
	execute 'colorscheme' name
	redraw
	echo name
endfunction
nnoremap <silent> <F8> :call <SID>rotate_colors()<cr>


"fzf.vim-------------------maps and uses----------------------


"Leader+L for line search in the current file.
nnoremap <silent> <Leader>L   :BLines<CR>
"Leader+B for buffer search.
nnoremap <silent> <Leader>B  :Buffers<CR>
"Leader+ff+Enter for file search.
nnoremap <silent> ff :Files

command! -bang DesktopFiles call fzf#vim#files('~/Desktop/', <bang>0)
nmap <Leader>_ :DesktopFiles<CR>

command! -bang Nand2tetris call fzf#vim#files ('~/nand2tetris', <bang>0)
nmap <Leader>- :Nand2tetris<CR>

" Default fzf layout
" - down / up / left / right
"let g:fzf_layout = { 'down': '~60%' }

"" In Neovim, you can set up fzf window using a Vim command
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '10new' }

"" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '/Users/arx6363/vimtemp/skim_his'
let g:fzf_files_options =
			\ '--preview "(coderay {} || bat {}) 2> /dev/null | head -'.&lines.'"'
let g:fzf_layout = {'window' : {'width' : 0.8, 'height' : 0.8}}

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)


command! AirlineThemes call fzf#run({
			\ 'source':  map(split(globpath(&rtp, 'autoload/airline/themes/*.vim'), "\n"),
			\               "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
			\ 'sink':    'AirlineTheme',
			\ 'options': '+m --prompt="Airline Themes> "',
			\ 'down':    '~40%'
			\})

nmap <F9> :AirlineThemes
"-------------------------------------------------------------------------

"--------multi_cursor-----------------------------------------------------------------
let g:multi_cursor_use_default_mapping=1

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"------------typescript vue and yaml--------------------------------
autocmd FileType typescript, vue, yaml :set sw=2 ts=2

let g:markdown_fenced_languages = [
			\ 'vim',
			\ 'help'
			\]

" Return to last edit position when opening a file
augroup resume_edit_position
	autocmd!
	autocmd BufReadPost *
				\ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
				\ | execute "normal! g`\"zvzz"
				\ | endif
augroup END


inoremap <F1> <Esc>
noremap <F1> :call MapF1()<CR>

function! MapF1()
  if &buftype == "help"
	exec 'quit'
  else
	exec 'help'
  endif
endfunction


"Cursor style while using terminal
"Mode Settings
" these are optional if want to change cursor style in terminal vim uncomment
" next 5 lines
"let &t_SI.="\e[5 q" "SI = INSERT modeare you ready for some code if yes tell yeah for you
"let &t_SR.="\e[4 q" "SR = REPLACE mode
"let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
"set ttimeout
"set ttimeoutlen=1
"Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
"
command! -nargs=* -complete=dir Cd call fzf#run(fzf#wrap(
			\ {'source': 'find '.(empty(<f-args>)? '.' : <f-args>).' -type d',
			\  'sink': 'cd'}))

 let g:UltiSnipsExpandTrigger= '<tab>'
 let g:UltiSnipsJumpForwardTrigger='<C-j>'
 let g:UltiSnipsJumpBackwardTrigger='<C-k>'
 " If you want :UltiSnipsEdit to split your window.
 let g:UltiSnipsEditSplit="vertical"
