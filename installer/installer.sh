#!/bin/bash

set -euo pipefail

# Variables
REPO_URL="https://github.com/StratOS-Linux/StratVIM.git"
CONFIG_DIR="$HOME/.config/nvim"
BACKUP_DIR="$HOME/.config/nvim.bak"


# Check internet before starting install
check_internet() {
	if ping -c 1 8.8.8.8 &> /dev/null
	then
		echo "$(tput bold;)Success$(tput sgr0)"
	else
		echo "$(tput bold; tput setaf 1)You do not have an internet connection ! Connect to the internet before running this script !$(tput sgr0)"
		exit 1
	fi	
}

# Function to install lazygit
install_lazygit() {
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    rm -f lazygit.tar.gz lazygit
}

# Function to install GitHub CLI
install_github_cli() {
    sudo mkdir -p -m 755 /etc/apt/keyrings
    wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
    sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install gh -y
}

# Function to install dependencies for Debian-based systems
install_debian_dependencies() {
    sudo apt-get update
    sudo apt-get install -y neovim npm xclip pandoc git
    install_github_cli
    install_lazygit
}

# Function to install dependencies for Fedora
install_fedora_dependencies() {
    sudo dnf install -y npm neovim xclip gh pandoc git
    install_lazygit
}

# Function to install dependencies for Arch Linux
install_arch_dependencies() {
    sudo pacman -S --noconfirm npm neovim xclip github-cli lazygit pandoc git
}

# Function to backup existing Neovim config
backup_neovim_config() {
    if [ -d "$CONFIG_DIR" ]; then
        echo "Existing Neovim configuration detected"
        echo "Moving it to $BACKUP_DIR"
        mv "$CONFIG_DIR" "$BACKUP_DIR"
    fi
}

os_detect() {
	# Detect OS and install dependencies
	if command -v apt &> /dev/null; then
		if [[ "$(lsb_release -rs | cut -d "." -f1)" -ge 22 ]]; then
			echo "Ubuntu version 22.04 or later detected"
			install_debian_dependencies
		else
			echo "Debian or Ubuntu (below 22.04) detected"
			sudo add-apt-repository ppa:neovim-ppa/unstable -y
			install_debian_dependencies
		fi
	elif command -v dnf &> /dev/null && [ -f "/etc/fedora-release" ]; then
		echo "Fedora Linux detected"
		install_fedora_dependencies
	elif command -v pacman &> /dev/null && [ -f "/etc/arch-release" ]; then
		echo "Arch Linux detected"
		install_arch_dependencies
	else
		echo "Unsupported OS"
		exit 1
	fi
}


clone_repo() {
	# Install StratVIM
	echo "Installing StratVIM"
	git clone "$REPO_URL" "$CONFIG_DIR"

	echo "StratVIM has been installed! Enjoy!"
}

main() {
	check_internet
	os_detect
	backup_neovim_config
	clone_repo
}

main
