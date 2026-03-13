# add this line to remove terminal last login message
[[ "$OSTYPE" == "darwin"* ]] && printf '\33c\e[3J'

# default terminal editor
export EDITOR='nvim'

# startship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# zoxide like autojump 
eval "$(zoxide init zsh)"

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# edit command line in vim mode
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^v' edit-command-line

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
# fzf-tab - replace system tab completion
source ~/.config/plugins/fzf-tab/fzf-tab.plugin.zsh
# zsh-autosuggestions
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# zsh-syntax-highlighting
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# homebrew
export PATH=/opt/homebrew/bin:$PATH
export LDFLAGS="-L/opt/homebrew/lib"
export CPPFLAGS="-I/opt/homebrew/include"
export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig"

# nvm
export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
# This loads nvm bash_completion
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

