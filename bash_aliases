alias ba='vim ~/.bash_aliases; source ~/.bash_aliases'
alias bar='source ~/.bash_aliases'
alias md5=md5sum
alias disk='sftp emueller@internal.emcien.com@disk.internal.emcien.com'
alias mdisk='gvfs-mount afp://emueller@disk.internal.emcien.com/Emcien'

alias gx='gitk --all'
alias gti='git'

alias br='bundle install && bundle clean --force'
alias rerake='rake clean && rake'
alias worker='rake resque:work TERM_CHILD=1 QUEUE=*'

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
alias cdpp="cd $HOME/src/patterns"
alias cde="cd $HOME/src/engine"
alias cdeo="cd $HOME/src/mcn-engine-mix"
alias cdmx="cd $HOME/src/mix"
alias cdsc="cd $HOME/src/scout"
alias cdsub="cdr && cd ext/engine"
alias cdd="cd $HOME/src/depot"
alias cdhd="cd $HOME/src/homedepot"

alias tunnel="autossh -R 12345:localhost:22 nevinera@nevinera.net -N 2 -f"


alias vpn="sudo ipsec stroke user-creds emcien emueller && sudo ipsec up emcien-office && sudo ipsec up emcien-vpcint && sudo ipsec up emcien-vpcex"
alias sysperf='sudo perf_3.12 record -a -g sleep 30; perf_3.12 report --sort comm,dso'
alias perf='perf_3.12'

alias pbcopy='xclip -selection clipboard'
alias pspec="RAILS_ENV=config/test.json rspec"
