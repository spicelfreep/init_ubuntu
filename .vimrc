set nocompatible              " be iMproved, required
filetype off                  " required

 " set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
    " alternatively, pass a path where Vundle should install plugins
    "let path = '~/some/path/here'
    "call vundle#rc(path)

    " let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

    " The following are examples of different formats supported.
    " Keep Plugin commands between here and filetype plugin indent on.
    " scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails.git'
    " The sparkup vim script is in a subdirectory of this repo called vim.
    " Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    " scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
    " scripts not on GitHub
Plugin 'git://git.wincent.com/command-t.git'
    " git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
    " ...
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'bling/vim-airline'
set laststatus=2
Plugin 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1  
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0

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
