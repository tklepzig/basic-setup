alias mkcd='function __mkcd() { mkdir "$1"; cd "$1"; unset -f __mkcd; }; __mkcd'
alias g='git'
alias git="LANGUAGE=en_US.UTF-8 git"
alias gk="LANGUAGE=en_US.UTF-8 gitk --all &"
alias gg="LANGUAGE=en_US.UTF-8 git gui &"

#show current branch and possible staged or unstaged changes in bash prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\u@\h:\w\[\033[01;32m\]$(__git_ps1)\[\033[00m\]\$ '
