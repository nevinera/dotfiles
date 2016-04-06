export EDITOR='vim'
export GCC=gcc-4.8

# export JAVA_HOME=`/usr/libexec/java_home`
export EC2_HOME='/usr/local/ec2/ec2-api-tools-1.7.3.2/'

source $HOME/.bash_prompt
source $HOME/.bash_aliases
[ -f /etc/bash_completion ] && source /etc/bash_completion

# ~/.bash_local is for things that I don't want in source control,
# either because they are secret, or because they don't apply to other machines.
[ -f "$HOME/.bash_local" ] && source "$HOME/.bash_local"

HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=2000000
# shopt -s globstar
shopt -s checkwinsize

[ -d $HOME/src/go ] && export GOPATH=$HOME/src/go
[ -d $HOME/src/rvm/bin ] && PATH=$PATH:$HOME/src/rvm/bin
[ -f $HOME/src/rvm/scripts/rvm ] && source $HOME/src/rvm/scripts/rvm

[ -d $HOME/.rvm/bin ] && PATH=$PATH:$HOME/.rvm/bin
[ -f $HOME/.rvm/scripts/rvm ] && source $HOME/.rvm/scripts/rvm

PATH=$HOME/bin:$GOPATH/bin:$PATH
export WARN_ERRORS='-Werror'


unset GNOME_KEYRING_CONTROL

[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
[ -f $HOME/.git-completion ] && source $HOME/.git-completion

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
