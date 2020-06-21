"Setting number as well as relative numbers for ease in scrolling and selection of line.
set nu
set rnu
"Setting history
set history=1000
set tabstop=4
set shiftwidth=4
set termguicolors
set splitright

if has('vim_starting')
	if &compatible
	       set nocompatible
       endif
endif

"Syntax enabled.
syntax on
filetype plugin indent on
"packadd! vimspector


"Folding by indent and folding starts at 10 lines.
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10


"Setting the same clipboard for Vim and System.
set clipboard=unnamed

"You see suggestion for commands in Airline.
set wildmenu

"Max textwidth after 80 characters new line will began.
"You can see count Airline.
set textwidth=79

"This is your leader key
:let mapleader = "\<Space>"


"Plugins
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'kshenoy/vim-signature'
Plug 'luochen1990/rainbow'
Plug 'Raimondi/delimitMate'
Plug 'jupyter-vim/jupyter-vim'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/taglist.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tmhedberg/simpylfold'
Plug 'jmcantrell/vim-virtualenv'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'ffanzhang/vim-airline-stopwatch'
Plug 'yggdroot/indentline'
"colorschemes      ---------------------------------
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


"Shortcut to access NERDTree toggle menu.
map N :NERDTreeToggle<CR>


"Airline configurations
let g:airline_theme='material'
let g:airline_powerline_fonts = 1
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol='✘'
let g:airline#extensions#coc#warning_symbol='⚠'


if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_section_c = '%{strftime("%H:%M")}'


"ColorScheme is like VScode.
colorscheme material
"set background=dark

let g:material_theme_style = 'default' "| 'palenight' | 'ocean' | 'lighter' | 'darker'


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

"Remapped ctrl+e to go to the end of the line in INSERT mode and ctrl+a to start of the line.
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0

"This will show lines as you indent you code.
"A real life saver for me.
let g:indentLine_bgcolor_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"indentLine settings for terminal and gui
autocmd! User indentLine doautocmd indentLine Syntax
let g:indentLine_color_term = 239
let g:indentLine_color_gui = 'purple'

"Setting directory for .backup, .swp, .undo files to location I want to.
set backupdir=.backup/,~/.backup/,/Users/arx6363/vimtemp//
set directory=.swp/,~/.swp/,/Users/arx6363/vimtemp//
set undodir=.undo/,~/.undo/,/Users/arx6363/vimtemp//

"Press F2 to execute python files.
autocmd FileType python nmap <F2> :CocCommand python.execInTerminal<CR>

"Your error and warnings.
nmap <F3> :CocDiagnostic<CR>


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
autocmd bufwritepost .vimrc source $MYVIMRC


"Abbreviation
iabbrev #i #include<stdio.h>
iabbrev #d #define

"Use of python's virtual envoirments.
let g:virtualenv_directory = '/Users/arx6363/.venvs'

"To follow pep8 indent
let g:python_pep8_indent_hang_closing=1
let g:python_pep8_indent_multiline_string=-1


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
"-----------------------------""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""""""""""""""-----------------

"Expansion of brackets
"Since now I am using coc.vim so this is the config for DelimitMate
imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<Plug>delimitMateCR"

"Rainbow Brackets plugin
let g:rainbow_active = 1

"Jupyter virtual env path
let g:vim_virtualenv_path = '/Users/arx6363/.venvs/1env'
if exists('g:vim_virtualenv_path')
	pythonx import os; import vim
	pythonx activate_this = os.path.join(vim.eval('g:vim_virtualenv_path'), 'bin/activate_this.py')
	pythonx with open(activate_this) as f: exec(f.read(), {'__file__': activate_this})
end

let g:jupyter_mapkeys = 0     "Default mapping of jupyter is disabled.

"-------------------------"""""""""jupyter mapped keys""""""""""""""-------------------------------------------------------------

"In terminal type 'jupyter qtconsole' and then in vim type ':JupyterConnect' (use tab) to connect jupyter kernel to vim
"then you can use these key mappings it is use full in debugging

" Run current file
nnoremap <buffer> <silent> <Leader>R :JupyterRunFile<CR>
nnoremap <buffer> <silent> <Leader>I :PythonImportThisFile<CR>

" Change to directory of current file
nnoremap <buffer> <silent> <Leader>d :JupyterCd %:p:h<CR>

" Send a selection of lines
nnoremap <buffer> <silent> <Leader>X :JupyterSendCell<CR>
nnoremap <buffer> <silent> <Leader>E :JupyterSendRange<CR>
vmap     <buffer> <silent> <Leader>v <Plug>JupyterRunVisual

nnoremap <buffer> <silent> <Leader>U :JupyterUpdateShell<CR>

" Debugging maps
nnoremap <buffer> <silent> <Leader>b :PythonSetBreak<CR>

"Leader+X Runs the whole file.
"Leader+E Runs that specific line.
"Leader+v Runs selected code in visual mode.

""""""""""""END""""""""""""""""""""""""""""""'
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"ColorScheme Setup
let g:gruvbox_contrast_dark = 'dark'
let g:seoul256_background = 235
let g:seoul256_light_background = 253


"---------------------------------------------Press F8 to change colorscheme---------------------------------------------------
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

"skim.vim-------------------------------------------- maps and uses ---------------------------------------------------------------


"Leader+L for line search in the current file.
nnoremap <silent> <Leader>L        :Lines<CR>
"Leader+B for buffer search.
nnoremap <silent> <Leader>B  :Buffers<CR>
"Leader+Enter for file search.
nnoremap <silent> ff  :SK

" Default fzf layout
" - down / up / left / right
let g:skim_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:skim_layout = { 'window': 'enew' }
let g:skim_layout = { 'window': '-tabnew' }
let g:skim_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
let g:skim_colors =
			\ { 'fg':      ['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'border':  ['fg', 'Ignore'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:skim_history_dir = '/Users/arx6363/vimtemp/skim_his'


"----------------------- Vim-multiple-cursor-config --------------------------------------------------
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

"--------------------------------------------------------- Coc-highlight ------------------------------------------------------
autocmd CursorHold * silent call CocActionAsync('highlight')


"-------------------------------------typescript vue and yaml -------------------------------------------------------------------------------------------
autocmd FileType typescript, vue, yaml :set sw=2 ts=2

"let g:vimspector_enable_mappings = 'HUMAN'
"----------------------------------------------------- Vim-lsp ------------------------------------------------------------------
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

