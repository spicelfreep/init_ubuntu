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
Plugin 'vim-syntastic/syntastic'         "自动检查语法错误-
Plugin 'Lokaltog/vim-powerline'          "这个可以让vim的状态栏变得很漂亮
Plugin 'plasticboy/vim-markdown'         "让vim支持markdown语法的高亮
Plugin 'Valloric/YouCompleteMe'          "自动补全插件，杀手级插件
Plugin 'scrooloose/nerdtree'             "给vim添加一个树形目录
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'


" ------------vim 插件配置--------------
"nerdtree
    "F2开启和关闭树"
    map <F2> :NERDTreeToggle<CR>
    let NERDTreeChDirMode=1
    "显示书签"
    let NERDTreeShowBookmarks=1
    "设置忽略文件类型"
    let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
    "窗口大小"
    let NERDTreeWinSize=25


" -------支持PEP8标准的python代码缩进-------
    " set *.py according to PEP8
au BufNewFile,BufRead *.py
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
" 用于解决多行缩进中可能出现的问题
Plugin 'vim-scripts/indentpython.vim'



" ---------------自动折叠------------------
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar, btw, the default setting is za
nnoremap <space> za
Plugin 'tmhedberg/SimpylFold'
" 希望看到折叠代码的文档字符串？
" let g:SimpylFold_docstring_preview=1



Plugin 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1  
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0


" -----标示不必要的空白字符------
"  au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" --------- 一键执行Python代码------
"按F5运行python" 
map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR>
function RunPython()
  let mp = &makeprg
  let ef = &errorformat
  let exeFile = expand("%:t")
  setlocal makeprg=python\ -u
  set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  silent make % 
  copen
  let &makeprg = mp
  let &errorformat = ef
endfunction

map <F11> :MBEbp<CR>
map <F12> :MBEbn<CR>

Plugin 'majutsushi/tagbar'
"nmap <Leader>tb :TagbarToggle<CR>      "快捷键设置
let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
let g:tagbar_width=30                   "窗口宽度的设置
map <F3> :Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"如果是c语言的程序的话，tagbar自动开启

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
