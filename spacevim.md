# 我的spacevim配置

## 安装
安装spacevim
```
```

安装支持
* flake8 用于支持代码检查功能
* yapf 用于支持代码格式化
* autoflake 便捷地删除未使用的imports
* isort 对imports进行排序
```
pip install --user flake8 yapf autoflake isort
```


## init.toml
见附件

## 问题
为毛文件树以工程根目录为起始啊，这很蛋疼

## 快捷键学习
感觉自己被骗了，快捷键根本不起作用= = 
https://spacevim.org/cn/layers/lang/python/


g d 跳转到定义处
spc l g d 生成docstring
spc b f 代码格式化
spc l s i ipython交互进程

spc l r 运行python代码
