#! /usr/bin/env bash
alias vi=nvim
alias vim=nvim
alias ba='vim ~/.bash_aliases; source ~/.bash_aliases'
alias bar='source ~/.bash_aliases'
alias md5=md5sum

alias gti='git'
alias it='git'

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
alias cds="cd $HOME/src"

alias cleardns='sudo discoveryutil udnsflushcaches'
alias dh="du -h -d 1"
alias shuffle="perl -MList::Util=shuffle -e 'print shuffle(<STDIN>);'"

alias cols='column -t -s,'

# sls bucket-name object/key/prefix
function sls {
  echo aws s3 ls s3://$1/$2
  aws s3 ls s3://$1/$2
}

# sget bucket-name object/key/prefix
function sget {
  echo aws s3 cp s3://$1/$2 /tmp/
  aws s3 cp s3://$1/$2 /tmp/
}

alias s3="aws s3"

function s3cat {
  aws s3 cp $1 -
}
