#!/bin/bash

install_dependencies() {
	sudo pacman -S neovim lazygit cargo npm nodejs python python-pywal xclip --noconfirm 
	echo -e "$(tput setaf 2 bold)Dependencies for StratVIM are installed.$(tput sgr 0)"
}

install_stratvim(){
	git clone https://github.com/StratOS-Linux/StratVIM.git ~/.config/nvim
	echo -e "$(tput setaf 2 bold)StratVIM is installed! You can now use StratVIM by typing 'nvim' in the terminal.$(tput sgr 0)"
}

install_dependencies
install_stratvim
