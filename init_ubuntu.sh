#!/bin/bash
# author : Jackie.xiao
# description : init your ubuntu 16.04 
# Usege : you should run as "sudo bash init_ubuntu.sh | tee init_ubuntu.log"

set -o nounset # avoid quote variable which not defined
set -o errexit # ignore command line which fail

if test "$#" -ne 0
then
	echo "Usge: sudo ./init_ubuntu.sh"
	exit 1
fi

### Step 0: Confirm which software you want to install ###
echo -e " \033[44;37;5m-----Step 0: Confirm which software you want to install -----\033[0m" 
echo " TODO"

### Step 1: Basic application install ###
echo -e "\033[44;37;5m-----Step 1: Basic applicaiton installi-----\033[0m"
echo "apt-get update......"
sudo apt-get -y update > /dev/null #update apt source 
echo "apt-get upgrade......"
sudo apt-get -y upgrade > /dev/null  #update the app that have been installed 
echo "apt-get dist-upgrade......"
sudo apt-get -y dist-upgrade > /dev/null #force the installation of packages's new dependencies

cd ~

function git_install(){
	dpkg -l | grep "[]git[]" > /dev/null
	if [ $? -eq 0 ];then
		echo -e "\033[32m you have install git \033[0m"
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
# TODO: generate ssh key
# sh-keygen -t rsa -C ${git_email}
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_rsa
fi
}

if [ ! -f ~/init_ubuntu ]
then
	echo -e "\033[32m you have clone init_ubuntu \033[0m"
else
	git clone https://github.com/Jackiexiao/init_ubuntu
fi

if [ ! -f ~/Downloads ]
then
	cd ~/Downloads
else
	mkdir ~/Downloads
fi

function sogou_install(){
	dpkg -l| grep sogou > /dev/null
	if [ $? -eq 0];then
		echo -e "\033[32m you have install sogou pinyin  \033[0m"
	else
		cd ~/Downloads
		echo -e "\033[32m install sogou pinyin \033[0m"
		wget -c "pinyin.sogou.com/linux/download.php?f=linux&bit=64" -O sogoupinyin_2.1.0.0086_amd64.deb
		sudo dpkg -i sogoupinyin_2.1.0.0086_amd64.deb
	fi
}

function vim_install(){
	dpkg -l|grep vim > /dev/null
	if [ $? -eq 0 ];then
		echo -e "\033[32m you have install vim \033[0m"
	else
		echo -e "\033[32m install vim \033[0m"
		# install vim 
		sudo apt-get -y install vim
		sudo apt-get -y install vim-gtk 
		cp ~/init_ubuntu/.vimrc ~/.vimrc
		# install ctags
		sudo apt-get -y install ctags
		mkdir -p ~/.vim/bundle
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
		vim +PluginInstall +qall
	fi
}
#More information about vundle: https://github.com/VundleVim/Vundle.vim
#关于vundle 详细的介绍可见：https://www.zhihu.com/question/24294358
#还可见：http://os.51cto.com/art/201507/484174.htm
### --------------------------------------------- ###
git_install
sogou_install
vim_install
### --------------------------------------------- ###
 
### Step 2: Optional application install ###
echo -e "\033[44;37;5m ------ Step 2: Optional applicaiton install ------\033[0m"

# install lantern 翻墙软件
function lantern(){
	echo -e "\033[32m install lantern \033[0m"
	cd ~/Downloads
	wget -c https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-64-bit.deb
	sudo dpkg -i  lantern-installer-64-bit.deb
}

# install hosts
function hosts(){
	cd ~
	echo -e "\033[32m install hosts \033[0m"
	git clone https://github.com/racaljk/hosts.git
	sudo cat ./hosts/hosts >> /etc/hosts
	rm -rf ./hosts/
}

#function sublime(){
	#TODO
#}

# Gitbook
function gitbook(){
	dpkg -l|grep nodejs > /dev/null
	if [ $? -eq 0 ];then
		echo -e "\033[32m you have install nodejs \033[0m"
	else
		echo -e "\033[32m install nodejs \033[0m"
		#nodejs
		sudo apt-get -y install nodejs
		#npm
		echo -e "\033[32m install npm \033[0m"
		sudo apt-get -y install npm
		sudo ln -s /usr/bin/nodejs /usr/bin/node
		echo -e "\033[32m install gitbook \033[0m"
		sudo npm install -g gitbook-cli
		# gitbook serve
		# gitbook install
fi
}

# Jekyll
function jekyll(){
	dpkg -l|grep ruby > /dev/null
	if [ $? -eq 0 ];then
		echo -e "\033[32m you have install ruby \033[0m"
	else
		echo -e "\033[32m install ruby \033[0m"
		#安装ruby2.1	
		sudo apt-get install -y openssl libreadline-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison libcurl4-openssl-dev
		cd ~/Downloads
		wget -c http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.gz
		sudo tar xzfv ruby-2.1.1.tar.gz
		cd ruby-2.1.1
		./configure --with-readline-dir=/usr/lib/x86_64-linux-gnu/libreadline.so
		sudo make
		sudo make install
		echo -e "\033[32m install jekyll \033[0m"
		sudo gem install jekyll
		sudo gem install jekyll-paginate
fi
}
# install typora
# TODO
# there is a bug during installing typora
function typora(){
	# optional, but recommended
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE

	# add Typora's repository
	sudo add-apt-repository 'deb https://typora.io ./linux/'
	sudo apt-get update

	# install typora
	sudo apt-get install typora
}


# install docker
function docker(){
	dpkg -l|grep docker > /dev/null
	if [ $? -eq 0 ];then
		echo -e "\033[32m you have install docker \033[0m"
	else
		echo -e "\033[32m install docker \033[0m"
		curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh -
fi
}

# install anaconda
function anaconda(){
	dpkg -l|grep anaconda > /dev/null
	if [ $? -eq 0 ];then
		echo -e "\033[32m you have install anaconda \033[0m"
	else
		echo -e "\033[32m install anaconda \033[0m"
		cd ~/Downloads
		wget -c https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh
		sudo bash Anaconda3-4.4.0-Linux-x86_64.sh
	fi
}

function tensorflow_cpu_docker(){
	echo -e "\033[32m install tensorflow CPU only using docker \033[0m"
	cd ~
	sudo docker run -it -p hostPort:containerPort TensorFlowCPUImage
}
function tensorflow_cpu_anaconda(){
	echo "install tensorflow CPU only using anaconda & python 3.6"
	echo -e "\033[32m  install tensorflow CPU only using anaconda & python 3.6\033[0m"
	cd ~
	conda create -n tensorflow
	source activate tensorflow
	sudo  pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.1.0-cp36-cp36m-linux_x86_64.whl
}

function flash(){
	apt-get -y install flashplugin-nonfree 
}

#function python(){
	#TODO
#}

function other_tools(){
	apt-get -y install tree
	apt-get -y install unrar unzip
}

### --------------------------------------------- ###
lantern
#hosts
other_tools
gitbook
jekyll
#typora
docker
#anaconda
#tensorflow_cpu_anaconda
flash
### --------------------------------------------- ###
echo -e "\033[44;37;5m ------Step 3 : Personal software installation ----- \033[0m"
function sysu_iarc(){
	mkdir ~/proj
	cd proj
	git clone https://gitlab.com/SYSU-IARC/building
	cd building
	source clone.sh
	cd ~
}

function merlin(){
	cd ~
	conda create --name merlin python=2.7
	source activate merlin
	sudo apt-get -y install csh
	pip install numpy scipy matplotlib lxml theano bandmat
	git clone https://github.com/CSTR-Edinburgh/merlin.git
	cd merlin/tools
	sudo bash compile_tools.sh
}

function gym_theano_keras(){
	echo "install gym, theano and keras"
	cd ~
	## install dependencies
	sudo apt-get install -y python-numpy python-dev cmake zlib1g-dev libjpeg-dev xvfb libav-tools xorg-dev python-opengl libboost-all-dev libsdl2-dev swig
	git clone https://github.com/openai/gym
	cd gym 
	pip install -e '.[all]'
}

function universe(){
	echo "install universe with agent runs as a regular python process in your OS"
        echo "if you want to build a docker image for the agent, click https://github.com/openai/universe and follow the instruction"
	cd ~
	conda create -n universe
	pip install numpy
	sudo apt-get -y install golang libjpeg-turbo8-dev make
	git clone https://github.com/openai/universe.git
	cd universe
	pip install -e .
}

### --------------------------------------------- ###
#sysu_iarc
#TODO bug here , it seems you can't conda using shell
#merlin
gym_theano_keras
universe
### ----------personal git----------------------- ###
cd ~
mkdir book
cd book
git clone https://github.com/Jackiexiao/diary
git clone https://github.com/Jackiexiao/myfaith

### --------------------------------------------- ###

echo -e "\033[44;37;5m -----------Step 4: Change file manually---------\033[0m"
echo "Sogou pinyin: if you install this, enter 'fcitx-config-gtk3' in the terminal and add sogou pinyin to input method, after reboot, it should work "
echo "vim:          Launch vim and run :PluginInstall "
#More information about vundle: https://github.com/VundleVim/Vundle.vim
echo "-----------------other software-----------------"
echo "(1) matlab"
echo "(2) anaconda"
echo "(3) merlin"
echo "(4) gym"
echo "(5) universe"
echo "(6) opencv"
echo "(7) tensorflow"
echo "(8) NVIDIA and cuda"
echo "------------------------------------------------"


echo -e "\033[44;37;5m -----------Step 5: Test for some installation ---------\033[0m"
function merlin_test(){
	cd ~/merlin/egs/slt_arctic/s1
	sudo bash run_demo.sh
}
#function tensorflow_cpu_anaconda_test(){
#}
### --------------------------------------------- ###
merlin_test
tensorflow_cpu_anaconda_test

### --------------------------------------------- ###
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -f install
### --------------------------------------------- ###


# install NVIDIA and cuda https://zhuanlan.zhihu.com/p/27168325
# or follow English tutorial http://cv-tricks.com/artificial-intelligence/deep-learning/deep-learning-frameworks/tensorflow/install-tensorflow-1-0-gpu-ubuntu-14-04-aws-p2-xlarge/

echo -e "\033[44;37;5m ------- init ubuntu successful! you should reboot then------\033[0m"
