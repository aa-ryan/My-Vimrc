# vimrc
I am getting started with vim , for python.

- If you want to install more plugins just place that plug statement in .vimrc between
</br>call plug#begin()
</br>Plug "--something--"
</br>call plug#end()


Some basic things, I use frequently in vim
1. Leader key is set to <space>.
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
 (IF YOU DON'T WANT TO INSTALL JUST REMOVE LINE 64 AND 65 FROM VIMRC)
 [Link](https://github.com/powerline/fonts)
     
