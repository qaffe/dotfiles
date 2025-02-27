# Path to Zinit installation
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Install Zinit if not already installed
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Add auto suggestions
zinit light zsh-users/zsh-autosuggestions

# Auto suggestion history settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Add completions
zinit light zsh-users/zsh-completions

# Add completion styling
zstyle ':completion:*' matcher-list 'm:a{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS'

# Add keybindings
# (I DON'T FEEL THE NEED TO RIGHT NOW, BUT CAN WITH BINDKEY)

# Add custom aliases
alias y='yazi'
alias ls='ls --color'
alias grep='grep --color=auto'

# Start starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"
