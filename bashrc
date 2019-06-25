alias lsnum='ls -al | grep "^-" | wc -l'
alias lsdir='ls -al | grep "^d" | wc -l'
alias svnget='svn propget svn:externals -R'
alias svnset='svn propset svn:externals . -F'
alias svndelete='svn status | grep ! | awk '{print $2}' | xargs svn delete'
alias svnsolve='svn resolve --accept working'
alias sst='svn status'
alias gst='git status'

# 设置常用的文件夹
export ff='/home/jackie/svn/ds_utils/trunk/ds_frontend'
export pp='/home/jackie/svn/ds_utils/trunk/ds_pinyin'
export zh='/home/jackie/svn/corpus/NLP_data/zh'
export ee='/home/jackie/svn/ds_utils/trunk/auto_evaluation_scripts'
export mm='/home/jackie/svn/ds_utils/trunk/ds_models'

