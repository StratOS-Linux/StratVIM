#!/bin/bash

if [ "$(command -v apt)" ] && [ "$(lsb_release -rs | cut -d " " -f1)" -gt 22.04 ]; then
	echo "Ubuntu version above 22.04 detected"
	echo "Installing dependencies"
	sudo apt-get update
	sudo apt-get install neovim npm xclip pandoc git
	# Installing github-cli
	sudo mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y 
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
elif [ "$(command -v apt)"] && [-f "/etc/debian_version"]; then
	echo "Debian or Ubuntu (below 22.10) detected"
	echo "Installing dependencies"
	sudo add-apt-repository ppa:neovim-ppa/unstable -y
	sudo apt-get update	
	sudo apt-get install neovim npm xclip pandoc git
	# Installing github-cli
	sudo mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y 
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
elif [ "$(command -v dnf)" ] && [ -f "/etc/fedora-release" ]; then
	echo "Fedora Linux detected"
	echo "Installing dependencies"
	sudo dnf install npm neovim xclip gh pandoc git
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
elif [ "$(command -v pacman)" ] && [ -f "/etc/arch-release" ]; then
	echo "Arch Linux detected"
	echo "Installing dependencies"
	sudo pacman -S npm neovim xclip github-cli lazygit pandoc git
fi

if [ -f "~/.config/nvim" ]; then
	echo "Existing neovim configuration detected"
	echo "Moving it to ~/.config/nvim.bak"
	mv ~/.config/nvim ~/.config/nvim.bak
fi

echo "Installing StratVIM"
git clone https://github.com/lugvitc/StratVIM.git ~/.config/nvim 

echo "StratVIM has been installed ! Enjoy !"
