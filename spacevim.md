# 我的spacevim配置

## 安装
安装spacevim
```
```
卸载spacevim

依赖库
* python 相关依赖
```
pip install --user flake8 yapf autoflake isort
```
  * flake8 用于支持代码检查功能
  * yapf 用于支持代码格式化
  * autoflake 便捷地删除未使用的imports
  * isort 对imports进行排序
* markdown 相关依赖
  * format markdown依赖
```
sudo apt install npm
sudo npm -g install remark
sudo npm -g install remark-cli
sudo npm -g install remark-stringify
# 检查是否安装成功
remark in.md -o out.md
# 如果出现错误 /usr/bin/env: node: No such file or directory，则
sudo ln -s /usr/bin/nodejs /usr/bin/node
```


## init.toml
见附件

## 问题
1. 默认文件目录呢？
4. markdown formatter 问题https://github.com/SpaceVim/SpaceVim/issues/1277
5. vsp ??
6. buffer 是什么鬼
7. 语法树怎么开启
8. 如何注释
9. vim中的buffer??
10. 代码折叠呢?
11. spacevim稳定性真的差，动不动崩溃
12. q q/ q? q: 这几个在原生vim中是什么意思
13. vim quickfix
16. fuzzy 搜索文件并打开
17. spc c p 和 spc c l 操作不相似问题
18. 官方文档中应该有跳转到相应条目的功能，这样好引用，而且应该增加搜索功能
19. 折叠代码的操作
20. 对vim8.0以下不友好，好像会卡顿？
21. 如何让它对长文本显示自动换行 `set wrap`
22. autopair??

## 常用快捷键
常用

    spc f t : 打开文件树 或者按 F3
    spc f o : 打开文件树且定位到当前文件所在位置
    spc t t : 打开内置标签tab管理器
    F2 : 打开tagbar
    spc b f : 格式化代码或者格式化markdown
    K : show document like python docstring [如果有开启lsp layer的话]
    g d 跳转到定义处
    spc [1-9] : 跳转到指定序号的窗口（就是上下左右分隔的窗口）
    spc w 也可以切换
    spc s c 取消搜索高亮
    ctrl + j/h/k/l 也可以切换
    <Leader> [1-9] : <Leader> 指的是 \， 访问指定序号的Buffers

    文件树内置快捷键:
        s v :split
        s g :vsplit

    注释:
        spc c l 注释/取消注释当前行
        spc c p 注释当前段落 P 则为反注释
        spc ; [num] j 往下注释num行数

    ctrl + e/y 前/后移动3行
    [] 前后跳转

        [] + spc 增加一个空行
        [] + b buffer （也可以<Leader> + [1-9]）
        [] + l 错误处
        [] + q 错误
        [] + t 标签页
        [] + w 窗口
        [] + e 移动行
        [] + p 粘贴


markdown相关

    spc l p : 预览markdown

界面显示

    spc t 8 高亮所有超过80列的字符
    spc t n 显示/隐藏行号
    spc t f 高亮指定列字符
    spc t s 语法检查
    spc t S 拼写检查
    spc t w 行尾空格检查

标签tab管理器相关

    spc t t : 打开内置标签管理器
    spc w F 新建一个标签页（等同于 spc t t + n）
    spc w o 切换标签页
    内置快捷键
        o open
        r rename
        n new tab
        N new tab without name
        ctrl+shift+up/down 上下移动tab
        Enter 进入标签页


error 相关

    spc e c : clear errors
    spc e n : next error
    spc e N : previous error
    spc t s : toggle syntax checker

python相关

    spc l g d 生成docstring
    spc l s i ipython交互进程
    spc l r 运行python代码

模糊搜索fuzzy finder

    再一次没看懂官网文档写的是啥

窗口相关

    spc w d 删除一个窗口（虽然我通常都是用:wq）
    spc w s 水平切割 S 并切换至新窗口
    spc w v 垂直切割 V 并切换至新窗口
    spc w w 切换窗口
    spc w r 顺序切换窗口
    spc w R 逆序切换窗口

使用帮助相关

    spc 等待一秒，会自动展示所有目前可用的快捷键
    spc h k 使用快捷键导航，展示 SpaceVim 所支持的前缀键
    spc h I 展示debug所需信息，如果遇到问题，可以用这个信息在github-issue上提问

搜索相关

    spc s s 在当前文件内进行搜索
    spc s d 在当前文件所在文件夹中进行搜索
    spc s b 在buffer中进行搜索
    spc s f 在任意目录中进行搜索
    spc s p 在工程中进行搜索 spc / 是更快的方式
    注意：使用tab or shift tab在搜索结果中上下移动，enter进入文件
    spc s / 用grep在当前目录搜索
    spc p / 同上，但是显示格式不同

其他

    spc f v d 打开SpaceVim用户配置文件

## SpaceVim的常用操作
:SPUpdate  更新SpaceVim及其插件
:SPDebugInfo! 获取运行日志（spc h I 直接打印log到markdown文件中）

# SpaceVim自定义

### 使用github的插件

    [[custom_plugins]]
    name = 'lilydjwg/colorizer'
    merged = 0


# 常见疑问
* ctrl + s / ctrl + q 在terminal中是停止滚动和恢复滚动的意思

