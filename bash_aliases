alias ba='vim ~/.bash_aliases; source ~/.bash_aliases'
alias bar='source ~/.bash_aliases'
alias md5=md5sum
alias disk='sftp emueller@internal.emcien.com@disk.internal.emcien.com'
alias mdisk='gvfs-mount afp://emueller@disk.internal.emcien.com/Emcien'
alias linesum='awk '"'"'{s+=$1} END {print s}'"'"

alias jira='mcn_ruby $HOME/src/mcn/bin/jira'
alias todo='jira list todo -c'
alias show='jira show -c'
alias comment='jira comment'
alias sprint='jira sprint -c'
alias mine='jira list open "creator=currentUser()" -c -o "created asc"'

alias ubuntu="ssh nevinera@nevinera.vm.emcien.com"
alias ubuntu="ssh nevinera@10.1.1.62"

alias gx='gitk --all'
alias gti='git'

alias be='bundle exec'
alias br='bundle install && bundle clean --force'
alias rerake='rake clean && rake -m -j 4'
alias prake='rake -m -j 4'
alias remake='make clean && make'
alias worker='rake resque:work TERM_CHILD=1 QUEUE=*'
alias egrind='valgrind --trace-children=yes --num-callers=50 --error-limit=no --partial-loads-ok=yes --undef-value-errors=no'

alias build_gems='
(FAKE_GEM_PLATFORM=x86_64-darwin-12 rake gem:build) &&
(FAKE_GEM_PLATFORM=x86_64-darwin-13 rake gem:build) &&
(FAKE_GEM_PLATFORM=x86_64-darwin-14 rake gem:build)
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

alias tmux="TERM=screen-256color-bce tmux"

alias cdd="cd $HOME/data"
alias cds="cd $HOME/src"
alias cdm="cd $HOME/src/mcn"
alias cdf="cd $HOME/src/force"
alias cdy="cd $HOME/src/yoda"
alias cdp="cd $HOME/src/predict"
alias cdre="cd $HOME/src/rules_extractor"
alias cdpe="cd $HOME/src/prediction_extractor"
alias cdbe="cd $HOME/src/extractor"
alias cdpp="cd $HOME/src/patterns"
alias cdp3="cd $HOME/src/patterns3"
alias cde="cd $HOME/src/engine"
alias cdeo="cd $HOME/src/mcn-engine-mix"
alias cdmx="cd $HOME/src/mix"
alias cdsc="cd $HOME/src/scout"
alias cdsub="cdr && cd ext/engine"

alias vpn="sudo ipsec stroke user-creds emcien emueller && sudo ipsec up emcien-office && sudo ipsec up emcien-vpcint && sudo ipsec up emcien-vpcex"
alias sysperf='sudo perf_3.12 record -a -g sleep 30; perf_3.12 report --sort comm,dso'
alias perf='perf_3.12'

# alias pbcopy='xclip -selection clipboard'
alias pspec="RAILS_ENV=config/test.json rspec"
alias pdb="RAILS_ENV=config/test.json rake db:reset"

alias respec="SKIP_ENGINE=1 rspec"

alias cleardns='sudo discoveryutil udnsflushcaches'
