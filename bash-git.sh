#!/bin/bash

accent='\033[1;33m'
normal='\033[0m'

isOS()
{
    shopt -s nocasematch
    if [[ "$OSTYPE" == *"$1"* ]]
    then
        return 0;
    fi

    return 1;
}

isProgramInstalled()
{
    command -v $1 >/dev/null 2>&1 || { return 1 >&2; }
    return 0
}

echo -e "${accent}Configuring .bashrc...${normal}"

if [ ! -f ~/.bashrc ]
then
    touch ~/.bashrc
fi

if ! grep -q "~/.custom-config" ~/.bashrc
then
    echo "if [ -f ~/.custom-config ]; then . ~/.custom-config; fi" >> ~/.bashrc;
fi
rm -f ~/.custom-config

#bash general
echo "alias mkcd='function __mkcd() { mkdir \"\$1\"; cd \"\$1\"; unset -f __mkcd; }; __mkcd'" >> ~/.custom-config
echo "export PROMPT_DIRTRIM=4" >> ~/.custom-config
echo "shopt -s extglob" >> ~/.custom-config
echo "shopt -s globstar" >> ~/.custom-config
echo "alias sf='~/search-files.sh'" >> ~/.custom-config

if isOS msys
then
    echo "alias e='explorer .'" >> ~/.custom-config
fi

if isProgramInstalled git
then
    echo "alias git='LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 git'" >> ~/.custom-config
    echo "alias g='git'" >> ~/.custom-config
    echo "alias gk='LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 gitk --all &'" >> ~/.custom-config
    echo "alias gg='LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 git gui &'" >> ~/.custom-config
    echo "alias gsa='~/git-status-all.sh'" >> ~/.custom-config
    echo "#show current branch and possible staged or unstaged changes in bash prompt" >> ~/.custom-config
    echo "export GIT_PS1_SHOWDIRTYSTATE=1" >> ~/.custom-config
    echo "export PS1='\u@\h:\[\033[0;33m\]\w\[\033[01;32m\]\`__git_ps1\`\[\033[00m\]\n\\$ '" >> ~/.custom-config
    echo "#for windows: maybe it is necessary to replace __git_ps1 with the following: __git_ps1 ' (%s)' (but only if some errors occurs...)" >> ~/.custom-config

    if isOS linux
    then
        echo ". /usr/share/bash-completion/completions/git" >> ~/.custom-config
    fi

    echo "__git_complete g __git_main" >> ~/.custom-config
    echo "__git_complete \"g l\" _git_log" >> ~/.custom-config
fi

if isProgramInstalled atom
then
    echo "alias a='atom .'" >> ~/.custom-config
fi

if isProgramInstalled code
then
echo "alias c='code .'" >> ~/.custom-config
fi


echo -e "${accent}Creating scripts...${normal}"

echo "   git-log.sh"
echo "#!/bin/bash" > ~/git-log.sh
echo "pattern=\"\"; args=\"\"" >> ~/git-log.sh
echo "for var in \"\$@\"; do" >> ~/git-log.sh
echo "[[ \$var == p:* ]] && pattern=\"-- ./*\${var:2}*\" || args=\"\$args \$var\"" >> ~/git-log.sh
echo "done" >> ~/git-log.sh
echo "git -c core.pager='less -SRF' log --graph --all --format='%C(yellow)%h%C(reset) - %C(cyan)(%ar)%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%Creset' \$args \$pattern" >> ~/git-log.sh


echo "   search-files.sh"
echo "#!/bin/bash" > ~/search-files.sh
echo "pattern=\"*\"" >> ~/search-files.sh
echo "[[ ! -z \$2 ]] && pattern=\"\$2\"" >> ~/search-files.sh
echo "echo -e \"Searching for ${accent}\\\"\$1\\\"${normal} in current directory matching files ${accent}\\\"\$pattern\\\"${normal}\"" >> ~/search-files.sh
echo "find . -type f -name \"\$pattern\" -print0 | xargs -I {} -0 grep -H \"\$1\" \"{}\"" >> ~/search-files.sh


echo "   git-status-all.sh"
echo "#!/bin/bash" > ~/git-status-all.sh
echo "dir=\${1-.}" >> ~/git-status-all.sh
echo "find \$dir -maxdepth 1 -mindepth 0 -type d -exec sh -c \"test -d \\\"{}/.git\\\" && (echo \\\"--------------------------------\\\" && echo \\\"{}\\\" && cd \\\"{}\\\" && git status -sb && echo && echo \\\"Branches:\\\" && git branch -vv --color && echo && echo)\" \\; | less -R" >> ~/git-status-all.sh


echo -e "${accent}Configuring general git settings...${normal}"

git config --global credential.helper store
git config --global push.default simple
git config --global fetch.prune true
git config --global pull.rebase true
git config --global diff.tool meld
git config --global merge.tool kdiff3
git config --global mergetool.keepBackup false
git config --global merge.kdiff3.keepBackup false
git config --global merge.kdiff3.trustExitCode false
git config --global merge.kdiff3.keepTemporaries false
git config --global core.editor "vim"
git config --global color.status always

echo -e "${accent}Configuring git aliases...${normal}"

git config --global alias.s  "status -sb"
git config --global alias.si  "status -sb --ignored"
git config --global alias.dt "difftool --dir-diff"
git config --global alias.dts "difftool --dir-diff --staged"
git config --global alias.d "!f() { git diff --word-diff \"./*\$1*\"; }; f"
git config --global alias.ds "!f() { git diff --staged --word-diff \"./*\$1*\"; }; f"
git config --global alias.l "!bash ~/git-log.sh"
git config --global alias.lm "!bash ~/git-log.sh --merges"
git config --global alias.ln "!bash ~/git-log.sh --name-status"
git config --global alias.ld "!bash ~/git-log.sh --date-order"
git config --global alias.r "!f() { git reset -- \"./*\$1*\"; }; f"
git config --global alias.rh "reset --hard"
git config --global alias.rs "reset --soft"
git config --global alias.a "!f() { git add \"./*\$1*\"; }; f"
git config --global alias.ap "!f() { git add --patch \"./*\$1*\"; }; f"
git config --global alias.cm "commit -m"
git config --global alias.cma "commit --amend"
git config --global alias.acm "!f() { git add --all && git commit -m \"\$1\"; }; f"
git config --global alias.acmp "!f() { git add --all && git commit -m \"\$1\" && git push; }; f"
git config --global alias.p "push"
git config --global alias.pt "push --tags"
git config --global alias.c "checkout"
git config --global alias.b "branch"
git config --global alias.ba "branch -a"
git config --global alias.bnm "branch --no-merged"
git config --global alias.f "fetch"
git config --global alias.m "merge"
git config --global alias.ma "merge --abort"
git config --global alias.mff "merge --ff-only"
git config --global alias.mr "merge --no-ff"
git config --global alias.mt "mergetool"
git config --global alias.rb "rebase"
git config --global alias.rbc "rebase --continue"
git config --global alias.rba "rebase --abort"
git config --global alias.undo "!f() { git reset --hard \$1 && git clean -df \$1; }; f"
git config --global alias.dummy "commit --allow-empty -m 'dummy commit, contains no change'"
git config --global alias.sw "show --word-diff --format=\"%C(yellow)%h%C(reset) - %C(cyan)(%ar)%C(reset) %B%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%Creset\""
git config --global alias.swn "show --word-diff --name-status --format=\"%C(yellow)%h%C(reset) - %C(cyan)(%ar)%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%Creset\""
git config --global alias.st "stash"
git config --global alias.stp "stash pop"

echo -e "${accent}Done.${normal}"
