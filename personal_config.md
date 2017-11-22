# Personal config of ubuntu 16
I suggest you don't use initial_ubuntu.sh, instead, do by yourself
```
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

sudo apt-get install vim
cp ~/init_ubuntu/.vimrc ~/.vimrc
sudo rm -rf ~/.vim
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

sudo apt-get install tree unrar unzip byobu
sudo cp -f ~/init_ubuntu/.tmux.conf ~/.byobu/

```

use unity-tweak-tool instead of ubuntu tweak
```
# install unity-tweak-tool
sudo apt-get install unity-tweak-tool
# install themes
sudo add-apt-repository ppa:noobslab/themes
sudo apt-get update
sudo apt-get install flatabulous-theme
# install flat icons
sudo add-apt-repository ppa:noobslab/icons
sudo apt-get update
sudo apt-get install ultra-flat-icons
```

echo "Sogou pinyin: if you install this, enter 'fcitx-config-gtk3' in the terminal and add sogou pinyin to input method, after reboot, it should work "

reference
http://www.jianshu.com/p/8cae8c37c130
