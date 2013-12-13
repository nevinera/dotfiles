export PATTERNS_SERVER_ID='nev3'
export PATTERNS_ROOT='/home/nevinera/.patterns-data'

export MATCH_BUCKET='s3.match.emcien.com'
export EDITOR='vim'

source /home/nevinera/.bash_prompt
source /home/nevinera/.bash_aliases
source /home/nevinera/.bash_profile
source /etc/bash_completion

export PATTERNS_TEST_FILES_PATH=/home/nevinera/data/patterns/test-files

HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=2000000
shopt -s globstar
shopt -s checkwinsize

PATH=$PATH:$HOME/src/rvm/bin
export WARN_ERRORS='-Werror -Wno-format-nonliteral'


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
unset GNOME_KEYRING_CONTROL
