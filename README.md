# 个人的Ubuntu 16.04 配置脚本与说明
在终端输入  
`user@user:~$  sudo bash init_ubuntu.sh`
如果你想保存安装日志，输入  
`user@user:~$  sudo bash init_ubuntu.sh | tee init_ubuntu.log`
## 一些说明
### 1 基础软件
**git** : 除了基本的用户名和邮箱设置，增加了一个十分有用的命令别名：`git lg`，用于简洁而美观地输出 git log

**vim** :
进行基础的配置，使用vundle管理vim插件，并自动安装了常用的插件，同时也配置好了轻量级的Python编程环境，具体你可以在.vimrc中进行设置，如果没有设置，则默认使用推荐的配置。  

### 2 翻墙软件
**lantern** : 一款每月免费500M流量的翻墙软件  *
官方github: https://github.com/getlantern/lantern  

**hosts**   : 通过更改hosts翻墙，但无法观看youtube视频  
官方github: https://github.com/racaljk/hosts  

### 3 写作与博客
**gitbook** : github推出的电子书编辑器                官网：      https://www.gitbook.com/  
**jekyll**  : 静态网站工具，可用于github pages         官网：     http://jekyll.com.cn/  
**typora**  ：非常简洁好用的markdown编辑器  

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
1.自定义按键[通过 XKB 修改键盘映射, 实现自定义按键](https://github.com/Chunlin-Li/Chunlin-Li.github.io/blob/master/blogs/linux/ubuntu-xkb-keyboard-remap.md)

2. 写python的vim插件配置 [推荐](http://mingxinglai.com/cn/2015/06/plugin-of-vim-for-python/)

3. 个人使用的其他软件安装
* TxtLive === Latex用
* Shadowsocks === 看这篇文章ubuntu配置参见这篇[文章](http://blog.csdn.net/superbfly/article/details/54950451),手机的话可以下载openWingy
*
4. ubuntu界面美化
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
5. 一些快捷键设置
* 截图ctrl+alt+a 将`gnome-screenshot
    -ac`加入到系统的shortcut里面,设置为ctrl+alt+a即可
