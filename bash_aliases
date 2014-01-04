alias ba='vim ~/.bash_aliases; source ~/.bash_aliases'
alias bar='source ~/.bash_aliases'
alias md5=md5sum

alias gx='gitk --all'

alias br='bundle install && bundle clean --force'
alias rerake='rake clean && rake'

alias cds='cd ~/src'

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

alias cds="cd $HOME/src"
alias cdpp="cd $HOME/src/patterns"
alias cde="cd $HOME/src/engine"
alias cdmx="cd $HOME/src/mix"

alias tunnel="autossh -R 12345:localhost:22 nevinera@nevinera.net -N 2 -f"
