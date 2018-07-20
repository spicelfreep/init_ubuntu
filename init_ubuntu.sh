#!/bin/bash
# author : Jackie.xiao
# description : init your ubuntu 16.04 
# Usege : you should run in your own user (not in root for convenient) as "sudo bash init_ubuntu.sh | tee init_ubuntu.log"

set -o nounset # avoid quote variable which not defined
#set -o errexit # ignore command line which fail

if test "$#" -ne 0
then
	echo "Usge: sudo ./init_ubuntu.sh"
	exit 1
fi

# general setting
cd ~
username=`users`
mkdir -p ~/Downloads
# function

function git_install(){
	dpkg -l | grep "[]git[]" > /dev/null
	if [ $? -eq 0 ];then
		echo -e "\033[32m you have install git \033[0m"
		echo "Do you want to config your git?[y\n]"
		read judge
		if [ ${judge} = "y" ];then
			echo "you choose yes"
			sudo apt-get -y install git > /dev/null
			echo "enter your git name"
			read git_name
			git config --global user.name ${git_name}
			echo "enter your git email"
			read git_email
			git config --global user.email ${git_email}
			# git alias
			git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
		else
			echo "you choose no"
		fi

	else
		echo -e "\033[32m install git\033[0m"
		sudo apt-get -y install git
		echo "enter your git name"
		read git_name
		git config --global user.name ${git_name}
		echo "enter your git email"
		read git_email
		git config --global user.email ${git_email}
		# git alias
		git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
	fi
}

function vim_install(){
	dpkg -l|grep vim > /dev/null
	if [ $? -eq 0 ];then
		echo -e "\033[32m you have install vim \033[0m"
		echo  "Do you want to set your vim to recommand setting?[y\n]"
		read judge
		if [ ${judge} = "y" ];then
			echo "you choose yes"
			sudo apt-get -y install vim-gtk 
			cp ~/init_ubuntu/.vimrc ~/.vimrc
			sudo rm -rf ~/.vim
			mkdir -p ~/.vim/bundle
			git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
			vim +PluginInstall +qall
		else
			echo "you choose no"
		fi
	else
		echo -e "\033[32m install vim \033[0m"
		# install vim 
		sudo apt-get -y install vim
		sudo apt-get -y install vim-gtk 
		cp ~/init_ubuntu/.vimrc ~/.vimrc
		mkdir -p ~/.vim/bundle
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
		vim +PluginInstall +qall
	fi
}
#More information about vundle: https://github.com/VundleVim/Vundle.vim
function tools_install(){
	echo -e "\033[32m install tools --tree && unrar unzip... \033[0m"
	apt-get -y install tree > /dev/null
	apt-get -y install unrar unzip > /dev/null
	sudo apt-get install adobe-flashplugin
	sudo apt-get install tmux
	sudo cp -f ~/init_ubuntu/.tmux.conf ~/
	sudo apt-get install p7zip-full # support compress 7z file, usage`7z x file.7z`
	# xournal is a pdf reader which could add note easily
	sudo apt-get install xournal 
	sudo apt-get install flashplugin-installer
}

function gnome_theme(){
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
}

function manual_install(){
	# Attention ! You should manally install !
	# (1) Jupyter notebook extensions
	# (2) jump out of the GFW
	# (3) tmux and add .tmux.conf 
}

echo -e "\033[44;37;5m-----Step 1: Basic applicaiton installi-----------------------------\033[0m"
echo "apt-get update......"
# sudo apt-get -y update > /dev/null #update apt source 
sudo apt-get -y update 
echo "apt-get upgrade......"
sudo apt-get -y upgrade > /dev/null  #update the app that have been installed 
echo "apt-get dist-upgrade......"
sudo apt-get -y dist-upgrade > /dev/null #force the installation of packages's new dependencies


# -----------MAIN PART-----------
git_install
vim_install
tools_install
gnome_theme

echo "Sogou pinyin: if you install this, enter 'fcitx-config-gtk3' in the terminal and add sogou pinyin to input method, after reboot, it should work "
### -----------End ! Successful------------------------ ###
echo -e "\033[44;37;5m ------- init ubuntu successful! you should reboot then------\033[0m"
### -----------End ! Successful------------------------ ###
echo -e "\033[44;37;5m ------- check init_ubuntu's manual_install and install by yourself------\033[0m"
