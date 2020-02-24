export EDITOR='vim'
export GCC=gcc-4.8
export KARMA_REPORTER='dots'

source $HOME/.bash_prompt
source $HOME/.bash_aliases
[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f $HOME/.git-completion ] && source $HOME/.git-completion

# ~/.bash_local is for things that I don't want in source control,
# either because they are secret, or because they don't apply to other machines.
[ -f "$HOME/.bash_local" ] && source "$HOME/.bash_local"

HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=2000000
# shopt -s globstar
shopt -s checkwinsize

PATH=$PATH:./bin
PATH=$PATH:$HOME/bin
PATH=$PATH:/usr/local/bin
