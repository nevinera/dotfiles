# Eric's Dotfiles

## List of software
* kitty - terminal emulator
* zsh - default shell
* rectangle - window manager
* rvm - ruby version manager
* caffeine - stay awake!

## Config steps
* keyboard setup (caps -> ctrl)
* install software
* setup github ssh key
* copy config into place
  - `export DOTF="$HOME/src/dotfiles"`
  - `ln -s $DOTF/zsh/rc $HOME/.zshrc`
  - `ln -s $DOTF/zsh/aliases $HOME/.zsh/aliases`
  - `ln -s $DOTF/zsh/git-completion.zsh $HOME/.zsh/_git`
  - `touch $HOME/.zsh/env_local`
  - `ln -s $DOTF/git/config $HOME/.gitconfig`
  - `ln -s $DOTF/bin $HOME/bin` # (might need to remove the target first)
  - `ln -s $DOTF/nvim $HOME/.config/nvim`

## List of Files
* RectangleConfig.json - configuration export from the Rectangle window manager
* `zsh/`
  - `rc` -> `~/.zshrc`
  - `aliases` -> `~/.zsh/aliases`
  - `git-completion.zsh` -> `~/.zsh/_git`
  - installed the `pure` zsh prompt, from https://github.com/sindresorhus/pure
  - `touch ~/.zsh/env_local` - this is for non-committed tokens and such
* `git/`
  - `config` -> `~/.gitconfig`
* `bin/`
  - `git-churn` -> `~/bin/git-churn`
  - `git-commit-contents` -> `~/bin/git-commit-contents`
  - `git-commit-summary` -> `~/bin/git-commit-summary`
* `kitty/` -> `~/.config/kitty/`

The `~/.zsh/env_local` needs `UTT_BEARER_TOKEN` set.
The `~/src/orders/.env.local` needs `ZOOM_API_KEY|SECRET` and `OKTA_API_TOKEN`
