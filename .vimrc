"---------基础偏好设置-------------
syntax on            " 开启语法高亮
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
set tabstop=4        " 设置tab长度
"set background=dark  " 设置背景颜色

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
"Plugin 'Valloric/YouCompleteMe'          "自动补全插件，杀手级插件
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
" ---------------自动折叠------------------
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar, btw, the default setting is za
nnoremap <space> za
Plugin 'tmhedberg/SimpylFold'
" 希望看到折叠代码的文档字符串？
" let g:SimpylFold_docstring_preview=1


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
