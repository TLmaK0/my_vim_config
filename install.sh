#!/bin/bash
cd ~ && curl -O -L https://github.com/TLmaK0/my_vim_config/archive/master.zip && unzip -q master.zip && rm master.zip && cp -r my_vim_config-master/.[!.]* ./ && rm -fr my_vim_config-master && vim +PlugInstall +qall
