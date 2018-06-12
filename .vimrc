"---------基础偏好设置-------------
syntax on            " 开启语法高亮
set term=screen-256color
set nocompatible     " 去掉vi的一致性
set laststatus=2     " 命令行为2行
set nu               " 设置显示行号
set mouse=a          " 启用鼠标
set hlsearch         " 高亮搜索结果
set ignorecase       " 搜索时忽略大小写
set cursorline       " 突出显示当前行：在当前行下显示横线，方便确认位置
"set cursorcolumn     " 突出显示当前列
set encoding=utf-8   " 使用 utf-8 编码
set showmatch        " 显示匹配的括号
"set background=dark  " 设置背景颜色
"set python 
set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
"end of set python

let g:indentLine_char='┆'        "缩进指示线，这个对于python很有用
let g:indentLine_enabled = 1     "启用缩进指示线
filetype off                     " Vundle 插件required

" -------------------Vundle设置----------------------------
 " set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
    " alternatively, pass a path where Vundle should install plugins
    "let path = '~/some/path/here'
    "call vundle#rc(path)

    " let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" ------------vim 插件推荐--------------
"Plugin 'vim-syntastic/syntastic'         "自动检查语法错误-
Plugin 'Lokaltog/vim-powerline'          "这个可以让vim的状态栏变得很漂亮
Plugin 'plasticboy/vim-markdown'         "让vim支持markdown语法的高亮
Plugin 'Valloric/YouCompleteMe'          "自动补全插件，杀手级插件
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'          "vim schemes颜色主题，相关设置请查看对应github仓库
" ---------------自动折叠------------------
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar, btw, the default setting is za
nnoremap <space> za
Plugin 'tmhedberg/SimpylFold'
" 希望看到折叠代码的文档字符串？
" let g:SimpylFold_docstring_preview=1

" ---------------颜色主题------------------
colorscheme molokai

" -----标示不必要的空白字符------
"  au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

filetype plugin indent on     " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on
    "
    " Brief help
    " :PluginList          - list configured plugins
    " :PluginInstall(!)    - install (update) plugins
    " :PluginSearch(!) foo - search (or refresh cache first) for foo
    " :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
    "
    " see :h vundle for more details or wiki for FAQ
    " NOTE: comments after Plugin commands are not allowed.
    " Put your stuff after this line
    "
