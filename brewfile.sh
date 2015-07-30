# Homebrew taps
TAPS=(
  homebrew/dupes
  homebrew/versions
  caskroom/cask
  caskroom/versions
)

# Homebrew formulae
FORMULAS=(
  coreutils
  moreutils
  findutils
  gnu-sed --default-names
  bash-completion
  caskroom/cask/brew-cask
  wget --enable-iri
  vim --override-system-vi
  homebrew/dupes/grep
  git
  node
  tree
  mongodb
  phantomjs
  gh
  the_silver_searcher
  nginx
  percona-server
  redis
  ack
  ctags
  exiv2
  gpg
  gpg2
  htop
  irssi
  jq
  mackup
  python
  pv
  rainbarf
  reattach-to-user-namespace
  rename
  snownews
  tmux
  watch
  lua52
)

# Homebrew casks
CASKS=(
  airfoil
  bettertouchtool
  bartender
  easysimbl
  github
  growlnotify
  honer
  little-snitch
  shadowsweeper
  skype
  slack
  spotify
  google-chrome
  firefox
  caffeine
  alfred
  dash
  sequel-pro
  the-unarchiver
  skype
  transmit
  qlcolorcode
  qlmarkdown
  qlprettypatch
  qlstephen
  quicklook-csv
  quicklook-json
  webp-quicklook
  transmission
  totalspaces
)

if test ! $(which brew); then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

for tap in ${TAPS[@]}; do
  brew tap $tap
done

for formula in ${FORMULAS[@]}; do
  brew install $formula
done

brew upgrade brew-cask

for cask in ${CASKS[@]}; do
  brew cask install $cask
done

brew cask alfred link
brew cleanup && brew cask cleanup
