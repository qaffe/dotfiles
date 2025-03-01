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

# Add syntax highlighting styling
ZSH_HIGHLIGHT_STYLES[keyword]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[string]='fg=green'
ZSH_HIGHLIGHT_STYLES[variable]='fg=cyan'


# Add auto suggestions
zinit light zsh-users/zsh-autosuggestions

# Add auto suggestion styling
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'

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
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Yazi function
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Start starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

hyfetch
