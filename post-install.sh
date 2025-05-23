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
	log "Syncing pacman databases..."
	pacman -Syy
	log "Installing base system packages..."
	pacman -Syu --noconfirm --needed \
        	base base-devel linux linux-firmware amd-ucode efibootmgr grub man-db	
	log "Installing drivers and graphics stack..."
	pacman -S --noconfirm --needed \
		mesa vulkan-radeon xf86-video-amdgpu xf86-video-vmware 
	log "Installing networking tools..."
	pacman -S --noconfirm --needed \
		wireless_tools iwd wpa_supplicant openssh ufw syncthing
	log "Installing Wayland environment and core components..."
	pacman -S --noconfirm --needed \
        	river waybar swaybg fuzzel grim slurp wl-clipboard \
        	xdg-desktop-portal xdg-desktop-portal-gnome xdg-desktop-portal-gtk xdg-desktop-portal-wlr \
        	xdg-user-dirs xdg-utils 
	log "Installing user applications..."
	pacman -S --noconfirm --needed \
        	firefox kitty keepassxc libreoffice-still obs-studio godot blender steam wine \
        	qemu mpv qutebrowser torbrowser-launcher openrgb gamescope
	log "Installing audio stack (PipeWire)..."
	pacman -S --noconfirm --needed \
        	pipewire pipewire-alsa pipewire-jack pipewire-pulse \
        	wireplumber pavucontrol gst-plugin-pipewire libpulse
	log "Installing shell enhancements and fonts..."
	pacman -S --noconfirm --needed \
        	noto-fonts noto-fonts-cjk ttf-hack \
        	starship figlet fastfetch hyfetch zsh
	log "Installing CLI utilities and development tools..."
	pacman -S --noconfirm --needed \
		brightnessctl lact smartmontools stow wget rustup jq yazi \
		dosfstools gnu-efi btop htop hyprpolkitagent vim neovim ripgrep \
		mtools xorriso cdrtools lld
	log "Installing miscellaneous tools..."
	pacman -S --noconfirm --needed \
		unzip 7zip kanshi mangohud gnome-keyring
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
	log "Syncing AUR databases..."
	sudo -u qaffe  yay -Syy
	log "Installing AUR packages..."
	sudo -u qaffe  yay -S --noconfirm --needed \
		lswt spotify phinger-cursors vesktop xdg-desktop-portal-termfilechooser-hunkyburrito-git \
}

# other minor tweaks
tweak_system() {
	return 0
}

main() {
	install_packages
	install_aur_helper
	install_aur_packages
	tweak_system
	
	log "Setup complete :3"
}

main "$@" # execute main
