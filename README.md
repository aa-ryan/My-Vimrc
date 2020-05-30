# vimrc
I am getting started with vim , for python. 
</br>(edit- It's been a while I have been using vim for not only python but C and C++ also.)

- If you want to install more plugins just place that plug statement in .vimrc between
</br>call plug#begin()
</br>Plug "--something--"
</br>call plug#end()


Some basic things, I use frequently in vim
1. Leader key is set to SPACEBAR.
2. Arrow keys are disabled. (for being efficient)
3. While in Insert mode if you want to move to end of the line press CTRL-E and for the top of the line press CTRL-A.
4. Most used commenting feature that comes with NERDcommentor.
 </br> Press Leader+cc - To comment out the whole line your cursor is on.
 </br>Press Leader+c$ - To comment from where your cursor is to the end of the line.
5. Auto-matic indentation is enabled for python.
6. Supertab enables TAB for auto completion.

That's not all the what plugins provide there is much more.

Some more commands to use in vim.
1. :SyntasticCheck     (use TAB for autocompletion)
2. :NERDtree for file browsing on your system.
3. :SuperTabHelp
4. :AirlineTheme (use this to change theme of you airline.)
     I personally use :AirlineTheme powerlineish  ()
     
 MAKE SURE TO INSTALL POWERLINE FONTS FOR AIRLINE TO WORK PROPERLY
 (IF YOU DON'T WANT TO INSTALL JUST REMOVE LINE 64, 65 and 66 FROM VIMRC)
 [Font](https://github.com/powerline/fonts)
 
 ** I don't feel like that I need nerdtree since I am using Macvim.
 
 Read the official documentation for more efficiency while writing code
 
 
 </br>[nerdtree](https://github.com/preservim/nerdtree)            
 </br>[fugitive](https://github.com/tpope/vim-fugitive)
 </br>[syntastic](https://github.com/vim-syntastic/syntastic)
 </br>[supertab](https://github.com/ervandew/supertab)
 </br>[airline](https://github.com/vim-airline/vim-airline)
 </br>[simpylfold](https://github.com/tmhedberg/simpylfold)
 </br>[delimitmate](https://github.com/raimondi/delimitmate)
 </br>[jedi-vim](https://github.com/davidhalter/jedi-vim)
 </br>[airline-themes](https://github.com/vim-airline/vim-airline-themes)
 </br>[nerdcommenter](https://github.com/preservim/nerdcommenter)
 </br>[vim-surround](https://github.com/tpope/vim-surround)
 </br>[stopwatch](https://github.com/ffanzhang/vim-airline-stopwatch)
 </br>[codedark](https://github.com/tomasiser/vim-code-dark)
