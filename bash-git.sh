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
echo "alias ls='ls -F --color=auto'" >> ~/.custom-config
echo "alias la='ls -A'" >> ~/.custom-config
echo "alias ll='ls -lh'" >> ~/.custom-config
echo "alias lla='ls -Ahl'" >> ~/.custom-config
echo "alias rmr='rm -rf'" >> ~/.custom-config
echo "export PROMPT_DIRTRIM=4" >> ~/.custom-config
echo "shopt -s extglob" >> ~/.custom-config
echo "shopt -s globstar" >> ~/.custom-config
echo "alias sif='~/.search-in-files.sh'" >> ~/.custom-config
echo "alias hgrep='~/.hgrep.sh'" >> ~/.custom-config
echo "alias update-my-config='curl -Ls https://raw.githubusercontent.com/tklepzig/basic-setup/master/bash-git.sh|bash'" >> ~/.custom-config

echo "_complete_ssh_hosts ()" >> ~/.custom-config
echo "{" >> ~/.custom-config
echo -e "\tCOMPREPLY=()" >> ~/.custom-config
echo -e "\tcur=\"\${COMP_WORDS[COMP_CWORD]}\"" >> ~/.custom-config
echo -e "\tcomp_ssh_hosts=\`awk '{split(\$1,aliases,\",\"); if (aliases[1] !~ /^\[/) print aliases[1]}' ~/.ssh/known_hosts ; cat ~/.ssh/config | grep "^Host " | awk '{print \$2}'\`" >> ~/.custom-config
echo -e "\tCOMPREPLY=( \$(compgen -W \"\${comp_ssh_hosts}\" -- \$cur))" >> ~/.custom-config
echo -e "\treturn 0" >> ~/.custom-config
echo "}" >> ~/.custom-config
echo "complete -F _complete_ssh_hosts ssh" >> ~/.custom-config

if isOS msys
then
    echo "alias e='explorer .'" >> ~/.custom-config
    echo "echo -ne \"\\e]4;4;#007fff\\a\"" >> ~/.custom-config
    echo "set completion-ignore-case off" > ~/.inputrc
fi

if isOS linux
then
    echo "alias n='nautilus .'" >> ~/.custom-config
fi


if isProgramInstalled git
then
    echo "alias git='LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 git'" >> ~/.custom-config
    echo "alias g='git'" >> ~/.custom-config
    echo "alias gk='LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 gitk --all &'" >> ~/.custom-config
    echo "alias gg='LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 git gui &'" >> ~/.custom-config
    echo "alias gsa='~/.git-status-all.sh'" >> ~/.custom-config
    echo "#show current branch and possible staged or unstaged changes in bash prompt" >> ~/.custom-config
    echo "export GIT_PS1_SHOWDIRTYSTATE=1" >> ~/.custom-config
    echo "export PS1='\u@\h:\[\033[0;33m\]\w\[\033[01;32m\]\`__git_ps1\`\[\033[00m\]\n\\$ '" >> ~/.custom-config
    echo "#for windows: maybe it is necessary to replace __git_ps1 with the following: __git_ps1 ' (%s)' (but only if some errors occurs...)" >> ~/.custom-config

    if isOS linux
    then
        echo ". /usr/share/bash-completion/completions/git" >> ~/.custom-config
    fi
   
    echo "__git_complete \"g s\" _git_status" >> ~/.custom-config
    echo "__git_complete \"g si\" _git_status" >> ~/.custom-config
    echo "__git_complete \"g sa\" _git_status" >> ~/.custom-config

    echo "__git_complete \"g dt\" _git_difftool" >> ~/.custom-config
    echo "__git_complete \"g dts\" _git_difftool" >> ~/.custom-config

    echo "__git_complete \"g d\" _git_diff" >> ~/.custom-config
    echo "__git_complete \"g ds\" _git_diff" >> ~/.custom-config

    echo "__git_complete \"g l\" _git_log" >> ~/.custom-config
    echo "__git_complete \"g ll\" _git_log" >> ~/.custom-config
    echo "__git_complete \"g lm\" _git_log" >> ~/.custom-config
    echo "__git_complete \"g ln\" _git_log" >> ~/.custom-config
    echo "__git_complete \"g lp\" _git_log" >> ~/.custom-config
    echo "__git_complete \"g ld\" _git_log" >> ~/.custom-config
    echo "__git_complete \"g ls\" _git_log" >> ~/.custom-config
    echo "__git_complete \"g lf\" _git_log" >> ~/.custom-config
    echo "__git_complete \"g lfp\" _git_log" >> ~/.custom-config
    
    echo "__git_complete \"g rl\" _git_reflog" >> ~/.custom-config
    echo "__git_complete \"g rll\" _git_reflog" >> ~/.custom-config

    echo "__git_complete \"g r\" _git_reset" >> ~/.custom-config
    echo "__git_complete \"g rh\" _git_reset" >> ~/.custom-config
    echo "__git_complete \"g rs\" _git_reset" >> ~/.custom-config

    echo "__git_complete \"g a\" _git_add" >> ~/.custom-config
    echo "__git_complete \"g ap\" _git_add" >> ~/.custom-config

    echo "__git_complete \"g cm\" _git_commit" >> ~/.custom-config
    echo "__git_complete \"g cma\" _git_commit" >> ~/.custom-config

    echo "__git_complete \"g p\" _git_push" >> ~/.custom-config
    #echo "__git_complete \"g pt\" _git_push" >> ~/.custom-config

    echo "__git_complete \"g c\" _git_checkout" >> ~/.custom-config

    echo "__git_complete \"g b\" _git_branch" >> ~/.custom-config
    echo "__git_complete \"g bd\" _git_branch" >> ~/.custom-config
    echo "__git_complete \"g ba\" _git_branch" >> ~/.custom-config
    echo "__git_complete \"g bnm\" _git_branch" >> ~/.custom-config

    echo "__git_complete \"g f\" _git_fetch" >> ~/.custom-config

    echo "__git_complete \"g m\" _git_merge" >> ~/.custom-config
    echo "__git_complete \"g ma\" _git_merge" >> ~/.custom-config
    echo "__git_complete \"g mff\" _git_merge" >> ~/.custom-config
    echo "__git_complete \"g mr\" _git_merge" >> ~/.custom-config

    echo "__git_complete \"g mt\" _git_mergetool" >> ~/.custom-config

    echo "__git_complete \"g rb\" _git_rebase" >> ~/.custom-config
    echo "__git_complete \"g rbc\" _git_rebase" >> ~/.custom-config
    echo "__git_complete \"g rba\" _git_rebase" >> ~/.custom-config

    echo "__git_complete \"g sw\" _git_show" >> ~/.custom-config
    echo "__git_complete \"g swn\" _git_show" >> ~/.custom-config

    echo "__git_complete \"g st\" _git_stash" >> ~/.custom-config
    echo "__git_complete \"g stp\" _git_stash" >> ~/.custom-config
    echo "__git_complete \"g stl\" _git_stash" >> ~/.custom-config
    echo "__git_complete \"g sta\" _git_stash" >> ~/.custom-config
    echo "__git_complete \"g sts\" _git_stash" >> ~/.custom-config
    
    echo "__git_complete \"g t\" _git_tag" >> ~/.custom-config
    echo "__git_complete \"g td\" _git_tag" >> ~/.custom-config
    echo "__git_complete \"g tl\" _git_tag" >> ~/.custom-config

    echo "__git_complete \"g wta\" _git_worktree" >> ~/.custom-config
    echo "__git_complete \"g wtp\" _git_worktree" >> ~/.custom-config
    echo "__git_complete \"g wtl\" _git_worktree" >> ~/.custom-config

    echo "__git_complete \"g cp\" _git_cherry_pick" >> ~/.custom-config
    echo "__git_complete \"g cpn\" _git_cherry_pick" >> ~/.custom-config
    
    echo "__git_complete \"g rv\" _git_revert" >> ~/.custom-config
    echo "__git_complete \"g rvn\" _git_revert" >> ~/.custom-config

    echo "__git_complete g __git_main" >> ~/.custom-config
fi


if isProgramInstalled atom
then
    if isOS linux
    then        
        echo "alias a='atom .'" >> ~/.custom-config
    else
        echo "alias atom='atom .'" >> ~/.custom-config
    fi
    
fi

if isProgramInstalled code-insiders
then
#    if isOS linux
#    then        
        echo "alias c='code-insiders .'" >> ~/.custom-config
#    else
#        echo "alias code='code .'" >> ~/.custom-config
#    fi
fi

echo -e "${accent}Creating scripts...${normal}"

echo "   .search-in-files.sh"
echo "#!/bin/bash" > ~/.search-in-files.sh
echo "pattern=\"*\"" >> ~/.search-in-files.sh
echo "[[ ! -z \$2 ]] && pattern=\"\$2\"" >> ~/.search-in-files.sh
echo "echo -e \"Searching for ${accent}\\\"\$1\\\"${normal} in current directory matching files ${accent}\\\"\$pattern\\\"${normal}\"" >> ~/.search-in-files.sh
echo "find . -type f -name \"\$pattern\" -print0 | xargs -I {} -0 grep -H --color \"\$1\" \"{}\"" >> ~/.search-in-files.sh


echo "   .hgrep.sh"
echo "#!/bin/bash" > ~/.hgrep.sh
echo "HISTFILE=~/.bash_history" >> ~/.hgrep.sh
echo "set -o history" >> ~/.hgrep.sh
echo "history | grep \"\$1\"" >> ~/.hgrep.sh


echo "   .git-status-all.sh"
echo "#!/bin/bash" > ~/.git-status-all.sh
echo "maxdepth=\${1-1}" >> ~/.git-status-all.sh
echo "find . -maxdepth \$maxdepth -mindepth 0 -type d -exec sh -c \"test -d \\\"{}/.git\\\" && (echo \\\"--------------------------------\\\" && echo \\\"{}\\\" && cd \\\"{}\\\" && git status -sb && echo && echo \\\"Branches:\\\" && git branch -vv --color && echo && echo)\" \\; | less -R" >> ~/.git-status-all.sh


echo "   .git-fetch-merge.sh"
echo "#!/bin/bash" > ~/.git-fetch-merge.sh
echo "git fetch" >> ~/.git-fetch-merge.sh
echo "currentBranch=\$(git symbolic-ref HEAD)" >> ~/.git-fetch-merge.sh
echo "for branch in \$(git for-each-ref --format='%(refname)' refs/heads/); do" >> ~/.git-fetch-merge.sh
echo "if [ \$currentBranch != \$branch ]" >> ~/.git-fetch-merge.sh
echo "then" >> ~/.git-fetch-merge.sh
echo "git fetch origin +\$branch:\$branch" >> ~/.git-fetch-merge.sh
echo "fi" >> ~/.git-fetch-merge.sh
echo "done" >> ~/.git-fetch-merge.sh
echo "git fetch origin \$currentBranch" >> ~/.git-fetch-merge.sh
echo "git merge --ff-only" >> ~/.git-fetch-merge.sh


echo -e "${accent}Configuring general git settings...${normal}"

logCommon="-c core.pager='less -SRF' log --graph --all --format='%C(yellow)%h%C(reset) %C(cyan)%><(15)%ar%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%Creset'"
reflogCommon="-c core.pager='less -SRF' reflog --format='%C(yellow)%h%C(reset) %C(dim yellow)%<(10)%gd%C(reset) %C(cyan)%><(15)%ar%C(reset) %gs%C(reset)%C(auto)%d%Creset'"
stashCommon="-c core.pager='less -SRF' stash list --format='%C(yellow)%h%C(reset) %C(dim yellow)%<(10)%gd%C(reset) %C(cyan)%><(15)%ar%C(reset) %gs%C(reset)'"


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
git config --global alias.sa "status -sb -uall"
git config --global alias.si "status -sb --ignored"
git config --global alias.dt "difftool --dir-diff"
git config --global alias.dts "difftool --dir-diff --staged"
git config --global alias.d "diff --word-diff"
git config --global alias.ds "diff --staged --word-diff"
git config --global alias.l "$logCommon -10"
git config --global alias.ll "$logCommon"
git config --global alias.lm "$logCommon --merges"
git config --global alias.ln "$logCommon --name-status"
git config --global alias.lp "$logCommon -p"
git config --global alias.ld "$logCommon --date-order"
git config --global alias.ls "$logCommon --simplify-by-decoration"
git config --global alias.lf "$logCommon --follow"
git config --global alias.lfp "$logCommon --follow -p"
git config --global alias.rl "$reflogCommon -10"
git config --global alias.rll "$reflogCommon"
git config --global alias.r "reset"
git config --global alias.rh "reset --hard"
git config --global alias.rs "reset --soft"
git config --global alias.a "add --all"
git config --global alias.ap "add --patch"
git config --global alias.cm "commit -m"
git config --global alias.cma "commit --amend"
git config --global alias.acm "!f() { git add --all && git commit -m \"\$1\"; }; f"
git config --global alias.acmp "!f() { git add --all && git commit -m \"\$1\" && git push --follow-tags; }; f"
git config --global alias.p "push --follow-tags"
#git config --global alias.pt "push --tags"
git config --global alias.c "checkout"
git config --global alias.b "branch"
git config --global alias.bd "branch -d"
git config --global alias.ba "branch -a"
git config --global alias.bnm "branch --no-merged"
git config --global alias.bv "branch -vv"
git config --global alias.f "fetch"
git config --global alias.fm "!f() { . ~/.git-fetch-merge.sh; }; f"
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
git config --global alias.stl "$stashCommon"
git config --global alias.sta "stash apply"
git config --global alias.sts "stash show"

git config --global alias.t "tag"
git config --global alias.td "tag -d"
git config --global alias.tl "tag --list"
git config --global alias.tlr "!f() { git show-ref --tags | sed 's?.*refs/tags/??'; }; f"

git config --global alias.wta "worktree add"
git config --global alias.wtp "worktree prune"
git config --global alias.wtl "worktree list"

git config --global alias.cp "cherry-pick"
git config --global alias.cpn "cherry-pick -n"

git config --global alias.rv "revert"
git config --global alias.rvn "revert -n"

echo -e "${accent}Configuring vim...${normal}"
echo "set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab" > ~/.vimrc
echo "set number" >> ~/.vimrc

echo -e "${accent}Done.${normal}"
