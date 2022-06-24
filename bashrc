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

PATH=$PATH:$HOME/bin
PATH=$PATH:/usr/local/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.nodenv/shims"
export PATH=$PATH:./bin

export NODE_OPTIONS="--max-old-space-size=4096"
export NEO4J_URL="http://localhost:7474"

# for now, point ut-translate at the staging translations-service
export TRANSLATIONS_SERVICE_URL="https://translation-service-ecs-staging.qa.usertesting.com/graphql"
