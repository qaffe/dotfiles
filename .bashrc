#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

# Cargo path
export PATH=/home/qaffe/.cargo/bin:$PATH

# Start starship
exprt STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init bash)"

# Spacing
echo ""
echo ""
# Startup text
result1=$(figlet -f ANSIShadow "hello")
result2=$(figlet -f ANSIShadow "qaffe :3")
echo -e "\033[38;2;255;158;255;m$result1\n\033[38;2;231;215;231;m$result2"
