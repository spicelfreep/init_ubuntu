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

function neovim_install(){
	# not recommand
	sudo apt-get install software-properties-common
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo apt-get update
	sudo apt-get install neovim
	# set neovim as default
	sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
	sudo update-alternatives --config vi
	sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
	sudo update-alternatives --config vim
	sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
	sudo update-alternatives --config editor
}

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

function vim8_install(){
	# warning: this make take a long time due to network problem
	sudo add-apt-repository ppa:jonathonf/vim
	sudo apt update
	sudo apt install -y vim
}

function vim_install(){
	dpkg -l|grep vim > /dev/null
	if [ $? -eq 0 ];then
		echo -e "\033[32m you have install vim \033[0m"
		echo  "Do you want to set your vim to recommand setting?[y\n]"
		read judge
		if [ ${judge} -ne "y" ];then
			echo "You choose no"
			return 0
		fi
		echo -e "\033[32m install vim \033[0m"
		# install vim
		sudo apt-get -y install vim
		sudo apt-get -y install vim-gtk
		cp ~/init_ubuntu/.vimrc ~/.vimrc
		# 安装flake8 以支持插件https://github.com/nvie/vim-flake8 -代码风格检查
		pip install flake8
		# 安装yapf 以支持代码格式化
		pip install yapf
		# 复制snippets
		mkdir -p ~/.vim
		cp -r mysnippets ~/.vim
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
	# https://linux.cn/article-10070-1.html ubuntu下好用的截图工具，类似QQ截图
	# /usr/bin/flameshot gui  需要将这个命令绑定到快捷键上，例如ctrl + alt + A
	sudo apt install flameshot 
	#sudo apt-get install adobe-flashplugin
	sudo apt install -y htop
	#sudo apt-get install p7zip-full # support compress 7z file, usage`7z x file.7z`
	# xournal is a pdf reader which could add note easily
	#sudo apt-get install xournal
	#sudo apt-get install flashplugin-installer
	sudo apt-get install meld
	sudo apt-get install tree
	#sudo apt-get install audacity
	sudo apt install unar # 用于解决ubuntu解压window文件乱码的情况，使用unar能自动检测编码
}

function screenshot(){
	# https://github.com/lupoDharkael/flameshot
	sudo apt install flameshot
	# /usr/bin/flameshot gui
	# 可以绑定这个命令到快捷键
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

function tmux_install(){
	sudo apt-get install tmux
	cd ~ && mkdir -p .tmux && cd ~/.tmux && mkdir tmux-resurrect
	sudo cp -f ~/init_ubuntu/.tmux.conf ~/
	# 以便能够让tmux复制的内容添加到系统剪贴板
	sudo apt-get install xclip
	# 以便能够在电脑重启之后重新开启之前的tmux
	git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/tmux-resurrect
	tmux source-file ~/.tmux.conf
	# 使用方法：
	# 保存状态：
	#    prefix + Ctrl-s
	# 恢复状态：
	#   prefix + Ctrl-r
}

function flameshot_install(){
	# Because flameshot on ubuntu 18.04 only have 0.5 version, which is missing text feature...
	sudo apt install g++ build-essential qt5-default qt5-qmake qttools5-dev-tools
	sudo apt install libqt5dbus5 libqt5network5 libqt5core5a libqt5widgets5 libqt5gui5 libqt5svg5-dev
	sudo apt install git openssl ca-certificates
	git clone https://github.com/lupoDharkael/flameshot.git
	cd flameshot
	mkdir build
	cd build
	qmake ../
	sudo make
	sudo make install
}

function oh_my_zsh_install(){
	sudo apt install zsh
	sudo apt install curl
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	cp ~/init_ubuntu/.zshrc ~/.zshrc
	# 设置默认为zsh终端，否则在bash下输入zsh开启，设置后需要重启电脑生效
	#sudo chsh -s $(which zsh)
	# 安装powerline 字体
	# sudo apt-get install fonts-powerline
	# 另外一种安装 fonts-powerline的方式
	#git clone https://github.com/powerline/fonts.git --depth=1
	#cd fonts
	#./install.sh
	# 安装插件：inrc：zsh的终端自动补全插件，但听网上的人说这个插件可能会引起一些某些冲突？
	# mkdir -p $ZSH_CUSTOM/plugins/incr
	# cd $ZSH_CUSTOM/plugins/incr && curl http://mimosa-pudica.net/src/incr-0.2.zsh > incr-0.2.zsh
	# cd ~ && source .zshrc
	# 安装插件： autojump：j 跳转到之前访问的目录
	# 貌似没有必要，暂时不管，用d 或者数字代替就好
	echo -e "\033[44;37;5m --You need to copy some of your .bashrc alias and anaconda path to .zshrc to make sure everything like your original .bashrc ---\033[0m"
}

#更改pip镜像源以便加快pip install 速度，豆瓣的镜像源太老了，所以更改
function pip_update_source(){
	pip install pip -U
	pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

	function change_ubuntu_apt_source(){
		Codename=$( (lsb_release -a)|awk '{print $2}'|tail -n 1 )
		sudo echo "
		deb http://mirrors.aliyun.com/ubuntu/ $Codename main multiverse restricted universe
		deb http://mirrors.aliyun.com/ubuntu/ $Codename-backports main multiverse restricted universe
		deb http://mirrors.aliyun.com/ubuntu/ $Codename-proposed main multiverse restricted universe
		deb http://mirrors.aliyun.com/ubuntu/ $Codename-security main multiverse restricted universe
		deb http://mirrors.aliyun.com/ubuntu/ $Codename-updates main multiverse restricted universe
		deb-src http://mirrors.aliyun.com/ubuntu/ $Codename main multiverse restricted universe
		deb-src http://mirrors.aliyun.com/ubuntu/ $Codename-backports main multiverse restricted universe
		deb-src http://mirrors.aliyun.com/ubuntu/ $Codename-proposed main multiverse restricted universe
		deb-src http://mirrors.aliyun.com/ubuntu/ $Codename-security main multiverse restricted universe
		deb-src http://mirrors.aliyun.com/ubuntu/ $Codename-updates main multiverse restricted universe
		">sources.list
		sudo apt update
	}
# 更改anaconda镜像源为清华镜像源
function conda_update_source(){
	conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
	conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
	conda config --set show_channel_urls yes
}

function shadowsocks_install(){
	# 这个感觉比pip install 来的方便多
	sudo apt install shadowsocks-libev
	# ss-local -c config.json
}
#function manual_install(){
#	# Attention ! You should manally install !
#	# (1) Jupyter notebook extensions
#	# (2) jump out of the GFW
#	# (3) tmux and add .tmux.conf
#}

echo -e "\033[44;37;5m-----Step 1: Basic applicaiton installi-----------------------------\033[0m"
echo "apt-get update......"
# sudo apt-get -y update > /dev/null #update apt source
#sudo apt-get -y update
echo "apt-get upgrade......"
#sudo apt-get -y upgrade > /dev/null  #update the app that have been installed
#echo "apt-get dist-upgrade......"
#sudo apt-get -y dist-upgrade > /dev/null #force the installation of packages's new dependencies


# -----------MAIN PART-----------
pip_update_source
#gnome_theme
#git_install
#vim_install
#vim8_install
#tmux_install
#tools_install
oh_my_zsh_install
#oh_my_zsh_install
change_ubuntu_apt_source

echo "Sogou pinyin: if you install this, enter 'fcitx-config-gtk3' in the terminal and add sogou pinyin to input method, after reboot, it should work "
echo "shadowsocks see README.md"
### -----------End ! Successful------------------------ ###
echo -e "\033[44;37;5m ------- init ubuntu successful! you should reboot then------\033[0m"
### -----------End ! Successful------------------------ ###
echo -e "\033[44;37;5m ------- check init_ubuntu's manual_install and install by yourself------\033[0m"
