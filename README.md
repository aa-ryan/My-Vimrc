# vimrc
I am getting started with vim , for python. 
</br>(edit- It's been a while I have been using vim for not only python but C and C++ also.)
</br> (edit - It's major upgrade now in my vimrc, will be adding a new file coc-setting.json.)
I started using **[coc.nvim](https://github.com/neoclide/coc.nvim)** and it's really a game changer.

</br>***Added lot of comments to .vimrc file to make it readable and to understand commands.***

- If you want to install more plugins just place that plug statement in .vimrc between
</br>call plug#begin()
</br>Plug "--something--"
</br>call plug#end()

After you install coc.nvim you need to run these commands.
* :CocInstall coc-python      (This will install python support for your coc.nvim i.e. autocompletion)
* :CocInstall coc-clangd      (This will install C and C++ support for coc.nvim i.e. autocompletion)

Some basic things, I use frequently in vim

1. Leader key is set to SPACEBAR.
2. Arrow keys are disabled only for insert and normal mode, it will work in command mode.
3. While in Insert mode if you want to move to end of the line press CTRL-E and for the top of the line press CTRL-A.
4. Most used commenting feature that comes with NERDcommentor.
 </br> Press Leader+cs - To comment out the whole line your cursor is on.
 </br>Press Leader+c$ - To comment from where your cursor is to the end of the line.



 MAKE SURE TO INSTALL POWERLINE FONTS FOR AIRLINE TO WORK PROPERLY
 (IF YOU DON'T WANT TO INSTALL JUST REMOVE LINE 64, 65 and 66 FROM VIMRC)
 [Font](https://github.com/powerline/fonts)
 
 ******************************************************************************************************
 
 Read the official documentation for more efficiency while writing code
 </br>[nerdtree](https://github.com/preservim/nerdtree)            
 [fugitive](https://github.com/tpope/vim-fugitive)
 </br>[airline](https://github.com/vim-airline/vim-airline)
 </br>[simpylfold](https://github.com/tmhedberg/simpylfold)
 </br>[delimitmate](https://github.com/raimondi/delimitmate)
 </br>[airline-themes](https://github.com/vim-airline/vim-airline-themes)
 </br>[nerdcommenter](https://github.com/preservim/nerdcommenter)
 </br>[vim-surround](https://github.com/tpope/vim-surround)
 </br>[stopwatch](https://github.com/ffanzhang/vim-airline-stopwatch)
 </br>[indent-line](https://github.com/yggdroot/indentline)
 </br>[coc.nvim](https://github.com/neoclide/coc.nvim)
 </br>[coc.python](https://github.com/neoclide/coc-python) Refer to this to understand what's going in coc-setting.json.
 </br>[coc.clangd](https://github.com/clangd/coc-clangd)
 </br>[rainbow](https://github.com/luochen1990/rainbow)
 </br>[pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent)
 </br>[virtualenv](https://github.com/jmcantrell/vim-virtualenv)
  
  I have been using a lot of colorschemes-->
 </br>[codedark](https://github.com/tomasiser/vim-code-dark)
 </br>[dracula](https://github.com/dracula/vim)
 </br>[jellybean](https://github.com/nanotech/jellybeans.vim)
