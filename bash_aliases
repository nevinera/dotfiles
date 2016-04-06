#! /usr/bin/env bash

alias vi=vim
alias ba='vim ~/.bash_aliases; source ~/.bash_aliases'
alias bar='source ~/.bash_aliases'
alias md5=md5sum

alias stop_mysql='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
alias start_mysql='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'

alias gti='git'

alias gcm="git commit -m"
alias gcf="OVERCOMMIT_DISABLE=1 git commit -m"
alias gcp="OVERCOMMIT_DISABLE=1 git push"
alias be='bundle exec'
alias br='bundle install && bundle clean --force'
alias rerake='rake clean && rake -m -j 4'
alias prake='rake -m -j 4'
alias remake='make clean && make'

alias la='ls -laFGh'
alias lt='ls -ltr'
alias l='ls -FG'

alias rmr='rm -r'

alias gitroot='git rev-parse --show-toplevel'
alias cdr='cd `gitroot`'
alias stat='git status'
alias gd='git diff -w'
alias gc='git commit -m'
alias gdc='git diff --cached'
alias diss='diff --side-by-side --suppress-common-lines'

############## Navigation stuff
alias cdd="cd $HOME/data"
alias cds="cd $HOME/src"
alias cdt='cd  "$(\ls -1dt ./*/ | head -n 1)"'
alias cdo="cd $HOME/src/orders"

alias cleardns='sudo discoveryutil udnsflushcaches'
alias dh="du -h -d 1"
alias shuffle="perl -MList::Util=shuffle -e 'print shuffle(<STDIN>);'"

alias cols='column -t -s,'
