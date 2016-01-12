#!/bin/bash

echo "Configuring general settings…"

git config --global credential.helper store
git config --global push.default simple
git config --global fetch.prune true
git config --global diff.tool meld
git config --global merge.tool kdiff3

echo "Configuring Aliases..."

git config --global alias.s  "status -s"
git config --global alias.dt "difftool --dir-diff"
git config --global alias.dts "difftool --dir-diff --staged"
git config --global alias.d "diff --word-diff"
git config --global alias.ds "diff --staged --word-diff"
git config --global alias.l "log --graph --all --format=\"%C(cyan)%ar by %an:%Creset %s%n%C(yellow)%h %C(auto)%d%Creset%n\""
git config --global alias.l2 "-c core.pager='less -CSRF' log --graph --all --format=\"%C(yellow)%h%C(reset) - %C(cyan)(%ar)%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%Creset\""
git config --global alias.r "reset"
git config --global alias.rh "reset --hard"
git config --global alias.a "add --all"
git config --global alias.ap "add --patch"
git config --global alias.cm "commit -m"
git config --global alias.acm "!f() { git add --all && git commit -m \"\$1\"; }; f"
git config --global alias.acmp "!f() { git add --all && git commit -m \"\$1\" && git push; }; f"
git config --global alias.c "checkout"
git config --global alias.b "branch"
git config --global alias.f "fetch"
git config --global alias.m "merge"
git config --global alias.mff "merge --ff-only"
git config --global alias.mr "merge --no-ff"
git config --global alias.mt "mergetool"
git config --global alias.rb "rebase"
git config --global alias.undo "!f() { git reset --hard \$1 && git clean -df \$1; }; f"

echo "Done."
