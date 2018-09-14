# 10 mins to SpaceVim

## 1. 对于老vimer
对于习惯使用nerdtree插件的vimer，第一次打开文件树`spc f t`可能会让你
觉得困惑，第一、文件树的根目录不一定是当前目录，而是所在项目的根目录，
这是通过[file flag](TODO)来查找的；第二，SpaceVim默认使用vimfiler而
不是nerdtree，因此一些文件操作不大相同，例如`h`在vimfiler中表示跳转
到父文件夹，`l`表示展开目录或打开文件。文件树下最常用的快捷键是
```
h j k l 移动键
sg 水平分屏打开文件
sv 垂直分屏打开文件
```

2. 使用fuzzy finder

如果想使用ctrl + v

To disable this altogether, stick stty -ixon in a startup script. 
To allow any key to get things flowing again, use stty ixany.


ag is not executable


如果你想使用回nerdtree，在`.SpaceVim.d/init.toml`中在[[option]]下加入
```
filemanager = 'nerdtree'
```
更多文件树中的操作见[file operator](TODO)



现在，尝试更多，打开SpaceVim，按下空格键spc，浏览所有的快捷键
及其说明吧
