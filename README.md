# vimrc
I am getting started with vim , for python. 
</br>(edit1 - It's been a while I have been using vim for not only python but C and C++ also.)
</br> (edit2  - It's major upgrade now in my vimrc, will be adding a new file coc-setting.json.)
I started using **[coc.nvim](https://github.com/neoclide/coc.nvim)** and it's really a game changer.

</br>***Added lot of comments to .vimrc file to make it readable and to understand commands.***

- If you want to install more plugins just place that plug statement in .vimrc between
</br>call plug#begin()
</br>Plug "--something--"
</br>call plug#end()

After you install coc.nvim you need to run these commands.
* :CocInstall coc-python      (This will install python support for your coc.nvim i.e. autocompletion)
* :CocInstall coc-clangd      (This will install C and C++ support for coc.nvim i.e. autocompletion)
* :CocInstall coc-highlight   (It is for better highlighting of code)
* :CocInstall coc-json        (Json - support)
* :CocInstall coc-vimlsp      (VimL - support)


Some basic things, I use frequently in vim

1. Leader key is set to SPACEBAR.
2. Arrow keys are disabled only for insert and normal mode, it will work in command mode.
3. While in Insert mode if you want to move to end of the line press CTRL-E and for the top of the line press CTRL-A.
4. Most used commenting feature that comes with NERDcommentor.
 </br> Press Leader+cs - To comment out the whole line your cursor is on.
 </br>Press Leader+c$ - To comment from where your cursor is to the end of the line.
 5.Skim.vim ---> Very use full plug, for searching file and inside files.Just :SK or <Leader>ff for files or <Leader>L for searching lines inside files. It changes workflow entirely.



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
 </br>[coc.python](https://github.com/neoclide/coc-python)--- Refer to this to understand what's going in coc-setting.json.
 </br>[coc.clangd](https://github.com/clangd/coc-clangd)
 </br>[coc.vimlsp](https://github.com/iamcco/coc-vimlsp)
 </br>[coc.json](https://github.com/neoclide/coc-json)
 </br>[coc.highlight](https://github.com/neoclide/coc-highlight)
 </br>[rainbow](https://github.com/luochen1990/rainbow)
 </br>[virtualenv](https://github.com/jmcantrell/vim-virtualenv)
 </br>[vim-lsp-cxx-highlight](https://github.com/jackguo380/vim-lsp-cxx-highlight)
 </br>[taglist](https://github.com/vim-scripts/taglist.vim)----------I mainly use :Tlist command to see my function and declarations at once.
 </br>[skim](https://github.com/lotabout/skim.vim) 
 </br>[vim-repeat](https://github.com/tpope/vim-repeat)
 </br>[vim-muliple-cursor](https://github.com/terryma/vim-multiple-cursors)---Read it's documentation for sure it's amazing.
 </br>[vim-signature](https://github.com/terryma/vim-multiple-cursors) ------It shows your marked lines read documentation.
 </br>[jupyter-vim](https://github.com/wmvanvliet/jupyter-vim)------Read documentation
  
  I have been using a lot of colorschemes-->
 </br>[codedark](https://github.com/tomasiser/vim-code-dark)
 </br>[dracula](https://github.com/dracula/vim)
 </br>[jellybean](https://github.com/nanotech/jellybeans.vim)
 </br>[gruvbox] (https://github.com/morhetz/gruvbox)
 </br>[material] (https://github.com/kaicataldo/material.vim)
 </br>[seoul] (https://github.com/junegunn/seoul256.vim)
 </br>[cosmi-latte] (https://github.com/nightsense/cosmic_latte)
 </br>[palenight] (https://github.com/drewtempelmeyer/palenight.vim)
 </br>[stellarlized] (https://github.com/nightsense/stellarized)
 </br>[zenburn] (https://github.com/jnurmine/Zenburn)
 </br>[nord] (https://github.com/arcticicestudio/nord-vim)



 
 
</br></br>
**coc-settings.json explanation**
You can access you coc-setting.json by command :CocConfig or you can find it in vim folder.

* C and C++ see for "clangd" below.

- "python.autoUpdateLanguageServer": true </br>(default value is true so you don't need to set this I have done this for my convenience.)</br>
(Make sure you have language server installed for that go to terminal and type)</br>
"pip install python-language-server"</br>

- "python.pythonPath": "/Users/username/.venvs/1env/bin/python" </br>(This is my path in my virtual envoirment since I don't want to mess with my system's python that's why I am it, using this have an advantage that I don't need to set Virtualenv path it is already using on of my virtualenv.)

-  "python.linting.enabled": true (Enabling linting for python)

-  "python.linting.pylintEnabled":true,  (Enabling pylint for python) </br>
   "python.linting.pylintPath":"/Users/username/.venvs/1env/bin/pylint" (Path to my pylint executable file)</br>
   To install pylint "pip install pylint"
   
- "python.linting.pylamaEnabled":true, (Enabling pylama)</br>
  "python.linting.pylamaPath":"/Users/username/.venvs/1env/bin/pylama" (Path to my pylama)</br>
  Note: For using pylama you should have atleast pycodestyle.</br>
  If you want it to use to full potential install pydocstyle, pyflakes or flake8.
  
  Commands: </br>* pip install pylama
            </br>* pip install pycodestyle
            </br>* pip install pydocstyle
            </br>* pip install pyflakes 
            </br>* pip install flake8

-  "python.jediEnabled":false, (Default set to false it's just optional)</br>
   "python.jediPath" : "/Users/username/.venvs/1env/lib/python3.8/site-packages/jedi" (Path to jedi)</br>
   
   Jedi is a completion libarary for python but now I am using MPLS (Microsoft Python Language Server)</br>
   If you set "false" coc.nvim will automatically download the latest MPLS for you.</br>
   You don't even need to set this to "false" just don't mention that line and path.

-  "python.venvFolders": [".venvs"],    </br> (It's just a list for what name folder can be with virtualenv you can add more to it)</br>
   "python.venvPath" : "/Users/username" (Path to my virtualenv)

- "python.sortImports.path":"/Users/username/.venvs/1env/bin/isort", (isort for sorting imports)</br>
  Commands:
          </br> * pip install isort
          

-   "clangd.semanticHighlighting":true,       (It is for highlighting vim-cxx-.. plugin)</br>
     "clangd.path": "/Users/username/.config/clangd_10.0.0/bin/clangd"  (For C and C++ user, it is my path to clangd)</br>
  Commands: 
      </br> * brew install clangd
 
 </br> For html
 -  "html.enable":true,</br> 
  "html.validate.scripts": true,    
  "html.format.enable":true,</br>

</br>It's for coc-highlight
  - "coc.preferences.colorSupport": true,</br>       
    "highlight.colors.enable": true

