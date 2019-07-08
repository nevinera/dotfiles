#! /usr/bin/env bash

alias vi=nvim
alias vim=nvim
alias ba='vim ~/.bash_aliases; source ~/.bash_aliases'
alias bar='source ~/.bash_aliases'
alias md5=md5sum

alias stop_mysql='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
alias start_mysql='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
alias stand='vim ~/standups.md'

alias gti='git'
alias it='git'

alias gcm="git commit -m"
alias gcf="OVERCOMMIT_DISABLE=1 git commit -m"
alias gcp="OVERCOMMIT_DISABLE=1 git push"
alias be='bundle exec'
alias br='bundle install --no-binstubs --jobs 6 && bundle clean --force && yarn install'
alias rerake='rake clean && rake -m -j 4'
alias prake='rake -m -j 4'
alias remake='make clean && make'
alias migrate='bundle exec rake db:migrate; bundle exec rake db:migrate RAILS_ENV=test'

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
alias cdt="cd $HOME/src/ut_tools"
alias cdtf="cd $HOME/src/teflon"
alias cdo="cd $HOME/src/orders"
alias cdv="cd $HOME/src/video-player"
alias cdp="cd $HOME/src/video_processor"
alias cdu="cd $HOME/src/uploader"
alias cdc="cd $HOME/src/census"
alias cdd="cd $HOME/src/deployer"
alias cdf="cd $HOME/Documents/fifth-edition"

alias cleardns='sudo discoveryutil udnsflushcaches'
alias dh="du -h -d 1"
alias shuffle="perl -MList::Util=shuffle -e 'print shuffle(<STDIN>);'"

alias cols='column -t -s,'

alias z='zeus'
alias zz='zeus start'
alias zt='zeus test'
alias zs='zeus server'
alias zc='zeus console'
alias zr='zeus rake'
alias zg='zeus generate'

alias gs='gulp spec'

alias bastion_tunnel='ssh -L 13306:mysql-replica.orders-production.usertesting.com:3306 orders-production+bastion1'
alias bastion_readonly_db='mysql --host=localhost --port=13306 --user=ut_orders --password usertesting_orders_production'
alias insights_tunnel="ssh -L 23306:oo4594uiiv95b3.cn3ucj1h9vhb.us-west-2.rds.amazonaws.com:3306 orders-insights+bastion1"

alias make_sql_tunnel='ssh -N -L 13306:mysql-replica.orders-production.usertesting.com:3306 orders-production+bastion1'
alias sql_tunnel_bobteam='ssh -N -L 13306:mysql-primary.orders-bobteam.qa.usertesting.com:3306 orders-bobteam+bastion1'
alias sql_tunnel_insights='ssh -N -L 13306:mysql-primary.orders-insights.qa.usertesting.com:3306 orders-insights+bastion2'
alias check_sql_tunnel='nc -z localhost 13306 || echo "No tunnel open on 13306"'

#prods3video HANDLE
function prods3video {
  echo aws s3 ls s3://uploader-production-app-videoinboxs3bucket-4nnebdwlhi2h/$1
  aws s3 ls s3://uploader-production-app-videoinboxs3bucket-4nnebdwlhi2h/$1
  echo aws s3 ls s3://ut-production-video-processing/pending/$1
  aws s3 ls s3://ut-production-video-processing/pending/$1
  echo aws s3 ls s3://ut-videos-secure/$1
  aws s3 ls s3://ut-videos-secure/$1
  echo aws s3 ls s3://ut-processed-files-secure/$1
  aws s3 ls s3://ut-processed-files-secure/$1
  echo aws s3 ls s3://ut-production-sensitive-archive/$1
  aws s3 ls s3://ut-production-sensitive-archive/$1
}

function stagings3video {
  echo aws s3 ls s3://ut-staging-video-processing/pending/$1
  aws s3 ls s3://ut-staging-video-processing/pending/$1
  echo aws s3 ls s3://ut-videos-dev/$1
  aws s3 ls s3://ut-videos-dev/$1
  echo aws s3 ls s3://ut-processed-files-dev/$1
  aws s3 ls s3://ut-processed-files-dev/$1
  echo aws s3 ls s3://ut-staging-sensitive-archive/$1
  aws s3 ls s3://ut-staging-sensitive-archive/$1
  echo aws s3 ls s3://ut-downloads-dev/$1
  aws s3 ls s3://ut-downloads-dev/$1
}

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

# s3probe s3://ut-production-video-processing/pending/FILENAME
# (usually supplied by `prods3video HANDLE`)
function s3probe {
  echo "=======> listing uri '$1'"
  aws s3 ls $1
  echo ""

  echo "=======> signing uri '$1'"
  signed=`aws s3 presign $1`
  echo "  $signed"
  echo ""

  echo "======> ffprobe '$signed'"
  ffprobe "$signed"
}

function s3cat {
  aws s3 cp $1 -
}

function lint {
  eslint . --format unix | grep $1
}
