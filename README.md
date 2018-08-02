# 个人的Ubuntu 16.04 配置脚本与说明
在终端输入  
`user@user:~$  sudo bash init_ubuntu.sh`
如果你想保存安装日志，输入  
`user@user:~$  sudo bash init_ubuntu.sh | tee init_ubuntu.log`

## 一些说明

### 0 初始设置
在system setting -> software update -> ubuntu software -> Download from那里设置 http://mirrors.aliyun.com/ubuntu 可以提高速度
### 1 基础软件
**git** : 除了基本的用户名和邮箱设置，增加了一个十分有用的命令别名：`git lg`，用于简洁而美观地输出 git log

**vim** :
进行基础的配置，使用vundle管理vim插件，并自动安装了常用的插件，同时也配置好了轻量级的Python编程环境，具体你可以在.vimrc中进行设置，如果没有设置，则默认使用推荐的配置。  

xournal: pdf阅读器，支持给pdf做笔记，看论文的时候很有用
```
 sudo apt-get install xournal
```
### 2 翻墙软件
**lantern** : 一款每月免费500M流量的翻墙软件  *
官方github: https://github.com/getlantern/lantern  

**hosts**   : 通过更改hosts翻墙，但无法观看youtube视频  
官方github: https://github.com/racaljk/hosts  

推荐使用shadowsocks+自行搭建国外服务器，翻墙更稳定

### 3 写作与博客
**gitbook** : github推出的电子书编辑器                官网：      https://www.gitbook.com/  
**jekyll**  : 静态网站工具，可用于github pages         官网：     http://jekyll.com.cn/  
**typora**  ：非常简洁好用的markdown编辑器  

```
# install typora
sudo add-apt-repository 'deb https://typora.io linux/'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo apt-get update
sudo apt-get install typora
# remove typora
sudo apt-get remove typora && sudo apt-get autoremove
```

### 4 常用软件
**Docker**  
**Anaconda**  

### 5 Linux常用工具
**tree**  
**unrar**  
**unzip**  

### 6 Openai
**gym**  
**universe**  

### 7 iNode校园网客户端
可参考安装[教程](http://www.cnblogs.com/Duane/p/6835456.html)

### 8 搜狗输入法的安装
可参考安装[教程](https://jingyan.baidu.com/article/08b6a591cb06f114a8092209.html)

## 关于Ubuntu的其他配置
1.自定义按键[通过 XKB 修改键盘映射, 实现自定义按键](ht   tps://github.com/Chunlin-Li/Chunlin-Li.github.io/blob/master/blogs/linux/ubuntu-xkb-keyboard-remap.md)

2. 写python的vim插件配置 [推荐](http://mingxinglai.com/cn/2015/06/plugin-of-vim-for-python/)

3. 个人使用的其他软件安装
* TxtLive === Latex用
* Shadowsocks === 看这篇文章ubuntu配置参见这篇[文章](http://blog.csdn.net/superbfly/article/details/54950451),手机的话可以下载openWingy
* 翻墙之后用sudo -H pip install 这样才能安装，-H 是装在local位置
4. ubuntu界面美化（默认在init_ubuntu里安装）
```
sudo apt-get install unity-tweak-tool
```
安装主题flatabulous
```
sudo add-apt-repository ppa:noobslab/themes
sudo apt-get update
sudo apt-get install flatabulous-theme
# 相应的扁平图标
sudo add-apt-repository ppa:noobslab/icons
sudo apt-get update
sudo apt-get install ultra-flat-icons
```
然后进入unity-tweak-tool进行相应的设置
5. 其他设置
* 截图ctrl+alt+a 将`gnome-screenshot
    -ac`加入到系统的shortcut里面,设置为ctrl+alt+a即可
* chrome 安装有道划词插件

6. 服务器端的设置
* 推荐阅读[如何与深度学习服务器优雅的交互？（长期更新）](https://zhuanlan.zhihu.com/p/32496193)

7. Chrome 安装
在这里下载对应的安装包https://www.google.cn/chrome/  然后用dpkg安装，如果有提示缺少依赖包，就先运行下apt-get -f install 然后再用dpkg安装一下即可

## ubuntu 系统安装常见问题
1. ubuntu 下制作ubuntu启动盘`sudo usb-creator-gtk` 或者使用 disks 因为：
```
The Startup Disk Creator is known to having some issues.
Use the Disks tool to create the Ubuntu installation media.
Open Disks and select Restore Disk Image from the menu on the top right of the application.
Choose the Ubuntu installation ISO file and the USB drive to write it to and start restoring.
```
2. ubuntu 16 系统下载地址 http://releases.ubuntu.com/16.04/

# Shadowsocks 
see website : https://blog.csdn.net/superbfly/article/details/54950451
https://blog.huihut.com/2017/08/25/LinuxInstallConfigShadowsocksClient/
```
sudo apt-get install python-pip 
pip install git+https://github.com/shadowsocks/shadowsocks.git@master 
```
network ==> method > manual, socks host 127.0.0.1, 1080, then copy shadowsocks.json, 

每次开机时候运行下面的命令即可
```
sslocal -c shadowsocks.json
```
