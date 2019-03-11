# my_vim_config

This command will replace your existing .vimrc:

```cd ~ && curl -O -L https://github.com/TLmaK0/my_vim_config/archive/master.zip && unzip -q master.zip && rm master.zip && cp -r my_vim_config-master/.[!.]* ./ && rm -fr my_vim_config-master```

Then run Vundle install:

```vim +PluginInstall +qall```

For ruby autocomplete, be sure that :ve return +ruby. In Ubuntu ```sudo apt-get install vim-nox``` for +ruby support.
