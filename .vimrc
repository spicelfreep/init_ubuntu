"<leader> default measn key '\'
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
" ------python pep8 indent---------------- 
au BufNewFile,BufRead *.py
\ set textwidth=79  " lines longer than 79 columns will be broken
\ set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
\ set tabstop=4     " a hard TAB displays as 4 columns
\ set expandtab     " insert spaces when hitting TABs
\ set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
\ set shiftround    " round indent to multiple of 'shiftwidth'
\ set autoindent    " align the new line indent with the previous line
"end of set python

au BufNewFile,BufRead *.js,*.html,*.css,*.vue
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2

" --------------记住上一次修改位置----------
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

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
"  Ie would be better to manually instal YouCompleteMe and python-mode plugin
"Plugin 'vim-syntastic/syntastic'        "自动检查语法错误-但这个感觉不大好
"Plugin 'w0rp/ale'                        "语法检查，记得vim version >8.0
Plugin 'Lokaltog/vim-powerline'          "这个可以让vim的状态栏变得很漂亮
"Plugin 'Valloric/YouCompleteMe'          "自动补全插件，杀手级插件
Plugin 'bling/vim-airline'               "让vim下面的信息条更好看
Plugin 'flazz/vim-colorschemes'          "vim schemes颜色主题'
Plugin 'nvie/vim-flake8'                 "PEP8 checking
Plugin 'scrooloose/nerdtree'             "browse file directory in vim
Plugin 'scrooloose/nerdcommenter'        " quick comment using <leader>ci
Plugin 'skywind3000/asyncrun.vim'        "在文件内执行Python代码
Plugin 'Yggdroot/indentLine'             "用|来展示缩进对齐
Plugin 'jiangmiao/auto-pairs'            "自动添加对应的括号
Plugin 'kien/ctrlp.vim'                  " ctrl + p to fuzzy search file in vim

"Plugin 'python-mode/python-mode'         " python ide help doc see :help python-mode
"Plugin 'posva/vim-vue'                   "vue.js syntax highlight
Plugin 'plasticboy/vim-markdown'         "让vim支持markdown语法的高亮
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

" --------------缩进对齐 ----Yggdroot/indentLine --------
let g:indentLine_char='┆'        "缩进指示线，这个对于python很有用
let g:indentLine_enabled = 1     "启用缩进指示线

" --------------python ide----------------
let g:pymode_python = 'python3' 
let g:pymode_syntax_space_errors = 0
" use python3 syntax checking
 
 
"----------注释comment-------nerdcommenter
"map <F4> <leader>ci <CR> 
"用F4来取代<leader>ci作注释

" ---------nerdtree 设置 ------------
map <C-n> :NERDTreeToggle<CR>
" 设置ctrl-n打开侧边栏的文件夹浏览器
" autocmd vimenter * NERDTree
" 每次打开vim的时候自动打开Nerdtree,感觉没有必要，所以这里没有开启
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" ----------显示不必要的空格----------
"Flagging Unnecessary Whitespace
"highlight BadWhitespace ctermbg=red guibg=darkred
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"-------- F5 自动运行代码相关配置----------
" Quick run via <F5>
nnoremap <F5> :call <SID>compile_and_run()<CR>
" set the quickfix window 6 lines height.
let g:asyncrun_open = 6
"
" ring the bell to notify you job finished
" let g:asyncrun_bell = 1
"
"" F10 to toggle quickfix window
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>"
" "

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! time python %"
    endif
endfunction
" augroup SPACEVIM_ASYNCRUN
"     autocmd!
"    " Automatically open the quickfix window
"     autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
" augroup END
"
" asyncrun now has an option for opening quickfix automatically
let g:asyncrun_open = 15

" ------vundle 必要设置-----------
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
" -------ubuntu下解决中文输入法返回normal环境的切换问题---------
" ------参考链接：https://www.jianshu.com/p/d6067b47cec4-------
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set timeoutlen=150
autocmd InsertLeave * call Fcitx2en()
"autocmd InsertEnter * call Fcitx2zh()
