alias vi=nvim
alias vim=nvim
alias ba='nvim ~/.bash_aliases; source ~/.bash_aliases'
alias bar='source ~/.bash_aliases'
alias md5=md5sum
alias disk='sftp emueller@internal.emcien.com@disk.internal.emcien.com'
alias mdisk='gvfs-mount afp://emueller@disk.internal.emcien.com/Emcien'
alias linesum='awk '"'"'{s+=$1} END {print s}'"'"
alias nvupdate='brew update && brew reinstall --HEAD neovim'

alias stop_mysql='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
alias start_mysql='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'

alias ab="rvm system do with_anybar"

alias jira='rvm 2.1.5@mcn do $HOME/src/jira/bin/jira'
alias list='jira list -c'
alias todo='jira list todo -c'
alias show='jira show -c'
alias view='jira show -b'
alias comment='jira comment'
alias est='jira estimate'
alias sprint='jira sprint -c'
alias mine='jira list open "creator=currentUser()" -c -o "created asc"'
alias start='jira transition "In Progress"'
alias unstart='jira transition "New,Re-Opened"'
alias finish='jira transition "Resolved,Closed"'
alias release='jira release -c'

function ffh {
  cd $HOME/src/force
  script/ssh - $1
  cd -
}
function ffs {
  cd $HOME/src/force
  script/ssh $1
  cd -
}
alias sshi='ssh -i ~/.ssh/engineering-key'
alias scpi='scp -i ~/.ssh/engineering-key'
alias fls='tree -d -L 2 $HOME/src/force/sys'

alias ubuntu="ssh nevinera@10.1.1.62"

alias gx='gitk --all'
alias gti='git'
function goto {
  cd $HOME/src/go/src/github.com/$1/$2
}
alias cdg="cd $HOME/src/go/src/github.com/nevinera/citadel"

alias patreset="cdpp; rake db:reset; rake users:admin; rmr ~/.patterns-data/reports/* ~/.patterns-data/shards/*; yes | script/shard/clear"

alias gcm="git commit -m"
alias gcf="OVERCOMMIT_DISABLE=1 git commit -m"
alias gcp="OVERCOMMIT_DISABLE=1 git push"
alias be='bundle exec'
alias br='bundle install && bundle clean --force'
alias rerake='rake clean && rake -m -j 4'
alias prake='rake -m -j 4'
alias remake='make clean && make'
alias worker='rake resque:work TERM_CHILD=1 QUEUE=*'
alias egrind='valgrind --trace-children=yes --num-callers=50 --error-limit=no --partial-loads-ok=yes --undef-value-errors=no'
alias relock="git checkout HEAD -- Gemfile.lock; bundle install && bundle clean --force"

alias rake='bundle exec rake'
alias rails='bundle exec rails'

alias build_gems='
(FAKE_GEM_PLATFORM=x86_64-darwin-12 bundle exec rake gem:build) &&
(FAKE_GEM_PLATFORM=x86_64-darwin-13 bundle exec rake gem:build) &&
(FAKE_GEM_PLATFORM=x86_64-darwin-14 bundle exec rake gem:build)
'


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

alias tmux="TERM=screen-256color-bce tmux"

alias cdgo="cd $GOPATH"
alias cdgs="cd $GOPATH/src"

alias cdd="cd $HOME/data"
alias cds="cd $HOME/src"
alias cdi="cd $HOME/src/iso_latte"
alias cdc="cd $HOME/src/citadel"
alias cdj="cd $HOME/src/jira"
alias cdth="cd $HOME/src/threepio"
alias cdl="cd $HOME/src/licensing_server"
alias cdf="cd $HOME/src/force"
alias cdy="cd $HOME/src/yoda"
alias cdp="cd $HOME/src/predict"
alias cdre="cd $HOME/src/rules_extractor"
alias cdpe="cd $HOME/src/prediction_extractor"
alias cdbe="cd $HOME/src/extractor"
alias cdpp="cd $HOME/src/patterns"
alias cdpat="cd $HOME/src/pat"
alias cde="cd $HOME/src/engine"
alias cde2="cd $HOME/src/engine-2"
alias cdx="cd $HOME/src/extract"
alias cdeo="cd $HOME/src/mcn-engine-mix"
alias cdmx="cd $HOME/src/mix"
alias cdsc="cd $HOME/src/scout"
alias cdsub="cdr && cd ext/engine"

alias master="git checkout master"

alias vpn="sudo ipsec stroke user-creds emcien emueller && sudo ipsec up emcien-office && sudo ipsec up emcien-vpcint && sudo ipsec up emcien-vpcex"
alias sysperf='sudo perf_3.12 record -a -g sleep 30; perf_3.12 report --sort comm,dso'
alias perf='perf_3.12'

# alias pbcopy='xclip -selection clipboard'
alias pspec="RAILS_ENV=config/test.json rspec"
alias pdb="RAILS_ENV=config/test.json rake db:reset"
alias rc='rubocop --format fuubar'
alias rca='rubocop --auto-correct'

alias respec="SKIP_ENGINE=1 SKIP_RUNS=1 bundle exec rspec"
alias spec="bundle exec rspec"
function gspec {
  ORIG_DIR=`pwd`
  cdr && cd gem/$1
  rspec
  RC=$?
  cd $ORIG_DIR
  return $RC
}

alias cleardns='sudo discoveryutil udnsflushcaches'
alias dh="du -h -d 1"
