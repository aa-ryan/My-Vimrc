"Setting number as well as relative numbers for ease in scrolling and selection of line.
set nu
set rnu
set history=1000
set nocompatible

"Syntax enabled.
syntax on
filetype plugin indent on

"By default I am using zsh shell.
"set shell=/bin/zsh

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
Plug 'luochen1990/rainbow'
Plug 'Raimondi/delimitMate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'nanotech/jellybeans.vim'
Plug 'jnurmine/zenburn'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tmhedberg/simpylfold'
Plug 'jmcantrell/vim-virtualenv'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'ffanzhang/vim-airline-stopwatch'
Plug 'tomasiser/vim-code-dark'
Plug 'yggdroot/indentline'
call plug#end()


"Shortcut to access NERDTree toggle menu.
map <C-n> :NERDTreeToggle<CR>


"You can't use arrows keys in vim
"Remapped ctrl+e to go to the end of the line in INSERT mode and ctrl+a to start of the line.
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0


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


"Airline configurations
let g:airline_theme='codedark'
let g:airline_powerline_fonts = 1
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_section_c = '%{strftime("%H:%M")}'


"ColorScheme is like VScode.
colorscheme codedark

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
nmap <F2> :CocCommand python.execInTerminal<CR>

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
set updatetime=300

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

" Use `ng` and `nn` to navigate diagnostics(ERROR and Warnings)
nmap <silent> ng <Plug>(coc-diagnostic-prev)
nmap <silent> nn <Plug>(coc-diagnostic-next)

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

"Expansion of brackets
"Since now I am using coc.vim so this is the config for DelimitMate
imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<Plug>delimitMateCR"

"Rainbow Brackets plugin
let g:rainbow_active = 1
