# Ubuntu 16.04 一键配置脚本
## 运行
首先修改init_ubuntu.sh文件，将你不想要的软件用#号注释掉，例如
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
