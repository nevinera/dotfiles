alias ba='vim ~/.bash_aliases; source ~/.bash_aliases'
alias bar='source ~/.bash_aliases'

alias bi='bundle install --jobs 3'
alias b='bundle exec'

alias gx='open -a SourceTree `gitroot`'

alias br='bundle install --jobs 3; bundle clean --force'
alias rerake='rake clean && rake'

alias la='ls -laFGh'
alias lt='ls -ltr'
alias l='ls -FG'

alias rmr='rm -r'

alias gitroot='git rev-parse --show-toplevel'
alias cdr='cd `gitroot`'
alias stat='git status'
alias gd='git diff'
alias gc='git commit -m'

alias tmux="TERM=screen-256color-bce tmux"

alias cds="cd $HOME/src"
alias cdpp="cd $HOME/src/patterns"
alias cde="cd $HOME/src/engine"
alias cdmx="cd $HOME/src/mix"
