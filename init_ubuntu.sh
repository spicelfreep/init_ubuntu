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

### general setting ###
cd ~
username=`users`
mkdir -p ~/Downloads
### -----------------------function------------------------###

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

function sogou_install(){
	echo -e "\033[32m sogou_intall\033[0m"
	dpkg -l| grep sogou > /dev/null
	if [ $? -eq 0 ];then
		echo -e "\033[32m you have install sogou pinyin  \033[0m"
	else
		cd ~/Downloads
		echo -e "\033[32m install sogou pinyin \033[0m"
		wget -c "pinyin.sogou.com/linux/download.php?f=linux&bit=64" -O sogoupinyin_2.1.0.0086_amd64.deb
		sudo dpkg -i sogoupinyin_2.1.0.0086_amd64.deb
		sudo apt-get -f install
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
			# install ctags
			sudo apt-get -y install ctags
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


# install lantern 翻墙软件
function lantern(){
	dpkg -l | grep lantern
	if [ $? -eq 0 ];then
		echo -e "\033[32m you have install lantern\033[0m"	
	else
		echo -e "\033[32m install lantern \033[0m"
		cd ~/Downloads
		wget -c https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-64-bit.deb
		sudo dpkg -i  lantern-installer-64-bit.deb
	fi
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
	echo -e "\033[32m install typora \033[0m"
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE

	# add Typora's repository
	sudo add-apt-repository 'deb https://typora.io ./linux/'
	sudo apt-get update

	# install typora
	sudo apt-get install typora
}


# install docker
function docker(){
	echo -e "\033[32m install docker \033[0m"
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
	echo -e "\033[32m install anaconda \033[0m"
	dpkg -l|grep anaconda > /dev/null
	#TODO bug: you can't judge if anaconda have been install by dpkg
	if [ $? -eq 0 ];then
		echo -e "\033[32m you have install anaconda \033[0m"
	else
		echo -e "\033[32m install anaconda \033[0m"
		cd ~/Downloads
		#TODO
		if [ -e Anaconda3-4.4.0-Linux-x86_64.sh ];then
			sudo bash Anaconda3-4.4.0-Linux-x86_64.sh
		else
			wget -c https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh
			sudo bash Anaconda3-4.4.0-Linux-x86_64.sh
			sudo chown -R ${username}:${username} ~/anaconda3
		fi
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

function other_tools(){
	echo -e "\033[32m install tools --tree && unrar unzip... \033[0m"
	apt-get -y install tree > /dev/null
	apt-get -y install unrar unzip > /dev/null
}

function merlin(){
	echo -e "\033[32m install merlin... \033[0m"
	cd ~
	conda create --name merlin python=2.7
	source activate merlin
	sudo apt-get -y install csh
	pip install numpy scipy matplotlib lxml theano bandmat
	git clone https://github.com/CSTR-Edinburgh/merlin.git
	sudo chown -R ${username}:${username} ~/merlin
	cd merlin/tools
	sudo bash compile_tools.sh
}

function gym_theano_keras(){
	echo -e "\033[32m install gym, theano and keras\033[0m"
	cd ~
	## install dependencies
	sudo apt-get install -y python-numpy python-dev cmake zlib1g-dev libjpeg-dev xvfb libav-tools xorg-dev python-opengl libboost-all-dev libsdl2-dev swig
	git clone https://github.com/openai/gym
	sudo chown -R ${username}:${username} ~/gym
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
	sudo chown -R ${username}:${username} ~/universe
	cd universe
	pip install -e .
}

function merlin_test(){
	cd ~/merlin/egs/slt_arctic/s1
	sudo bash run_demo.sh
}

function python_pip(){
	sudo apt-get install python-pip
	sudo pip install --upgrade pip
}

function flash_install(){
	sudo apt-get install adobe-flashplugin
}

# sox is use for play any audio file from terminal 
# Usage: using command line "play *.audio_file_type
funciton sox_install(){
	sudo apt-get install sox
	sudo apt-get install sox libsox-fmt-all
}

# byobu is a useful tool to manage you terminal window 
function byobu_install(){
	sudo apt-get install byobu
	sudo cp -f ~/init_ubuntu/.tmux.conf ~/.byobu/
}

### Step 0: Confirm which software you want to install ###
#echo -e "\033[44;37;5m-----Step 0: Confirm which software you want to install ------------\033[0m" 
#echo " TODO"

### Step 1: Basic application install----------------- ###
echo -e "\033[44;37;5m-----Step 1: Basic applicaiton installi-----------------------------\033[0m"
echo "apt-get update......"
sudo apt-get -y update > /dev/null #update apt source 
echo "apt-get upgrade......"
sudo apt-get -y upgrade > /dev/null  #update the app that have been installed 
echo "apt-get dist-upgrade......"
sudo apt-get -y dist-upgrade > /dev/null #force the installation of packages's new dependencies

git_install
if [ -e ~/init_ubuntu ]
then
	echo -e "\033[32m you have clone init_ubuntu \033[0m"
else
	git clone https://github.com/Jackiexiao/init_ubuntu
fi
sudo chown -R ${username}:${username} ~/init_ubuntu
#sogou_install
vim_install

 
### Step 2: Optional application install-------------- ###
echo -e "\033[44;37;5m ---------- Step 2: Optional applicaiton install -----------\033[0m"
#lantern
hosts
#other_tools
#gitbook
#jekyll
#typora
#docker
#anaconda
python_pip
#tensorflow_cpu_anaconda
sox_install
byobu_install


### ---------Step 3 : Other software installation ---###
echo -e "\033[44;37;5m ------------Step 3 : other software installation ----------- \033[0m"
#merlin
#TODO bug here , it seems you can't conda without install anaconda 
#gym_theano_keras
#universe


### ---------Step 4: Test for some installation-------- ###
echo -e "\033[44;37;5m -----------Step 5: Test for some installation ---------\033[0m"
#merlin_test

### ---------Step 5: Update software again------------- ###
echo -e "\033[44;37;5m ---------Step 6: Update software again----------\033[0m"
echo "apt-get update again......"
sudo apt-get -y update > /dev/null #update apt source 
echo "apt-get upgrade again......"
sudo apt-get -y upgrade > /dev/null  #update the app that have been installed 
echo "apt-get dist-upgrade again......"
sudo apt-get -y dist-upgrade > /dev/null #force the installation of packages's new dependencies

### ----------Step 6: Change file manually------------- ###
echo -e "\033[44;37;5m -----------Step 4: Change file manually---------\033[0m"
echo "Sogou pinyin: if you install this, enter 'fcitx-config-gtk3' in the terminal and add sogou pinyin to input method, after reboot, it should work "
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

# install NVIDIA and cuda https://zhuanlan.zhihu.com/p/27168325
# or follow English tutorial http://cv-tricks.com/artificial-intelligence/deep-learning/deep-learning-frameworks/tensorflow/install-tensorflow-1-0-gpu-ubuntu-14-04-aws-p2-xlarge/

### -----------End ! Successful------------------------ ###
echo -e "\033[44;37;5m ------- init ubuntu successful! you should reboot then------\033[0m"
