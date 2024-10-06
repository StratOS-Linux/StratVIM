#!/bin/bash

set -euo pipefail

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

# Detect OS and install dependencies
if command -v apt &> /dev/null && [[ "$(lsb_release -rs | cut -d "." -f1)" -ge 22 ]]; then
    echo "Ubuntu version 22.04 or later detected"
    echo "Installing dependencies"
    sudo apt-get update
    sudo apt-get install -y neovim npm xclip pandoc git
    install_github_cli
    install_lazygit
elif command -v apt &> /dev/null && [ -f "/etc/debian_version" ]; then
    echo "Debian or Ubuntu (below 22.04) detected"
    echo "Installing dependencies"
    sudo add-apt-repository ppa:neovim-ppa/unstable -y
    sudo apt-get update
    sudo apt-get install -y neovim npm xclip pandoc git
    install_github_cli
    install_lazygit
elif command -v dnf &> /dev/null && [ -f "/etc/fedora-release" ]; then
    echo "Fedora Linux detected"
    echo "Installing dependencies"
    sudo dnf install -y npm neovim xclip gh pandoc git
    install_lazygit
elif command -v pacman &> /dev/null && [ -f "/etc/arch-release" ]; then
    echo "Arch Linux detected"
    echo "Installing dependencies"
    sudo pacman -S --noconfirm npm neovim xclip github-cli lazygit pandoc git
fi

# Backup existing Neovim config
if [ -d "$HOME/.config/nvim" ]; then
    echo "Existing Neovim configuration detected"
    echo "Moving it to ~/.config/nvim.bak"
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"
fi

# Install StratVIM
echo "Installing StratVIM"
git clone https://github.com/lugvitc/StratVIM.git "$HOME/.config/nvim"

echo "StratVIM has been installed! Enjoy!"
