export PATH=$PATH:/usr/local/mysql/bin:$HOME/bin
export PATTERNS_SERVER_ID='nev2'
export PATTERNS_ROOT='/Users/nevinera/.patterns-data'

export SCOUT_COLLECTOR_AUTH_TOKEN='gumjab'
export SCOUT_COLLECTOR_RECURRING='true'

export MATCH_BUCKET='s3.match.emcien.com'

alias git=hub

source /usr/local/git/contrib/completion/git-completion.bash
source /Users/nevinera/.bash_prompt
source /Users/nevinera/.bash_aliases

[[ -s "/Users/nevinera/.rvm/scripts/rvm" ]] && source "/Users/nevinera/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export WARN_ERRORS='-Werror'
export GHI_TOKEN="4ffcbbaaadf3b4d9970190e4fba7f75fc6864ab4"
export PATTERNS_TEST_FILES_PATH=/Users/nevinera/data/patterns/test-files
