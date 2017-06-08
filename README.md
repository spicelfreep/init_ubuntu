# Ubuntu 16.04 一键配置脚本 V0.1 beta
## 运行
首先修改init_ubuntu.sh文件，在### Step 2 ###中（在sh脚本的末尾位置）将你不想要的软件用#号注释掉，例如
`#git_install` 
`vim_install`
`#sogou_install`
在终端输入  
`user@user:~$  sudo bash init_ubuntu.sh`
  
如果你想保存安装日志，输入  
`user@user:~$  sudo bash init_ubuntu.sh | tee init_ubuntu.log`
## 支持
支持ubuntu 16.04, ubuntu 14.04下运行情况未知
## Bug
目前搜狗输入法使用命令行安装存在问题，建议手动安装
## 一键安装软件目录
git : 除了基本的用户名和邮箱设置，增加了一个十分有用的命令别名：`lg`，用于简洁而美观地输出 git log 
vim : 进行基础的配置，使用vundle管理vim插件，并自动安装了如下常用插件
    Plugin 'tpope/vim-fugitive'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'tpope/vim-rails.git'
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'bling/vim-airline'
