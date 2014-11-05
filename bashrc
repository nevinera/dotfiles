export PATTERNS_SERVER_ID='nev3'
export PATTERNS_ROOT="$HOME/.patterns-data"

export MATCH_BUCKET='s3.match.emcien.com'
export EDITOR='vim'

source $HOME/.bash_prompt
source $HOME/.bash_aliases
[ -f /etc/bash_completion ] && source /etc/bash_completion

# ~/.bash_local is for things that I don't want in source control,
# either because they are secret, or because they don't apply to other machines.
[ -f "$HOME/.bash_local" ] && source "$HOME/.bash_local"

export PATTERNS_TEST_FILES_PATH=$HOME/data/patterns/test-files

HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=2000000
# shopt -s globstar
shopt -s checkwinsize

[ -d $HOME/src/rvm/bin ] && PATH=$PATH:$HOME/src/rvm/bin
[ -f $HOME/src/rvm/scripts/rvm ] && source $HOME/src/rvm/scripts/rvm

[ -d $HOME/.rvm/bin ] && PATH=$PATH:$HOME/.rvm/bin
[ -f $HOME/.rvm/scripts/rvm ] && source $HOME/.rvm/scripts/rvm

PATH=$HOME/bin:$PATH
export WARN_ERRORS='-Werror'


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
unset GNOME_KEYRING_CONTROL

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
