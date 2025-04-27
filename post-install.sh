#!/bin/bash
set -e

# fancy colours for readability
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RED="\033[0;31m"
NC="\033[0m"

log() {
	echo -e "${GREEN}[+] $1${NC}" # send green formatted text
}

warn() {
	echo -e "${YELLOW}[!] $1${NC}" # send yellow formatted text
}

error() {
	echo -e "${RED}[!] $1${NC}" >&2 # send red formatted text to error output
}

# ensure script is running as root
if [[ $EUID -ne 0 ]]; then
	error "This script must be run as root (use sudo)"
	exit 1
fi

# install non-aur packages
install_packages() {
	log "Installing base system packages..."
	pacman -Syu --noconfirm --needed \
        	base base-devel linux linux-firmware amd-ucode efibootmgr grub man-db	
	log "Installing drivers and graphics stack..."
	pacman -S --noconfirm --needed \
		mesa vulkan-radeon xf86-video-amdgpu xf86-video-ati xf86-video-nouveau xf86-video-vmware 
	log "Installing networking tools..."
	pacman -S --noconfirm --needed \
		wireless_tools iwd wpa_supplicant openssh ufw syncthing
	log "Installing Wayland environment and core components..."
	pacman -S --noconfirm --needed \
        	river waybar fuzzel grim slurp wl-clipboard \
        	xdg-desktop-portal xdg-desktop-portal-gnome xdg-desktop-portal-gtk xdg-desktop-portal-wlr \
        	xdg-user-dirs xdg-utils
	log "Installing user applications..."
	pacman -S --noconfirm --needed \
        	firefox kitty keepassxc libreoffice-still obs-studio godot blender steam wine \
        	torbrowser-launcher openrgb gamescope

	log "Installing audio stack (PipeWire)..."
	pacman -S --noconfirm --needed \
        	pipewire pipewire-alsa pipewire-jack pipewire-pulse \
        	wireplumber pavucontrol gst-plugin-pipewire libpulse

	echo "Installing shell enhancements and fonts..."
	pacman -S --noconfirm --needed \
        	noto-fonts noto-fonts-cjk ttf-hack \
        	starship figlet neofetch hyfetch zsh

	echo "Installing CLI utilities and development tools..."
	pacman -S --noconfirm --needed \
		brightnessctl corectrl smartmontools stow wget rust jq yazi \
		btop htop hyprpolkitagent vim neovim

	echo "Installing miscellaneous tools..."
	pacman -S --noconfirm --needed \
		7zip kanshi mangohud gnome-keyring
}

# install aur helper
install_aur_helper() {
	if ! command -v yay &> /dev/null; then
		log "Installing yay (AUR helper)..."
		cd /tmp
		git clone https://aur.archlinux.org/yay.git
		cd yay
		makepkg -si --noconfirm
		cd ~
	else
		warn "yay is already installed, skipping..."
	fi
}

# install aur packages
install_aur_packages() {
	return 0	
}

# install vim plugin manager
install_vim_plug() {
	if [[ ! -f "/home/qaffe/.local/share/nvim/site/autoload/plug.vim" ]]; then
		log "Installing vim-plug (Neovim plugin manager)..."
		sh -c 'curl -fLo "/home/qaffe/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        	log "vim-plug installed for Neovim."
	else
		warn "vim-plug is already installed for Neovim."
	fi
}

# other minor tweaks
tweak_system() {
	return 0
}

main() {
	install_packages
	install_aur_helper
	install_aur_packages
	install_vim_plug
	tweak_system
	
	log "Setup complete :3"
}

main "$@" # execute main
