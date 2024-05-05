#!/usr/bin/env bash

# Define a function to check whether a folder exists
get_or_update() {
	# Accept folder path as argument
	local git_path="$1"
	local folder_path="$2"

	# Check if the folder exists
	if [ -d "$folder_path" ]; then
		echo "Folder $2 exists. Updating ..."
		cd $2
		git pull
	else
		echo "Getting plugin $1"
		git clone $1
	fi
}

echo "> Installing zsh ..."
#https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
sudo apt update
sudo apt install zsh thefuck fzf tmux
zsh --version

# Check if the default shell is Zsh or Bash
if [[ "$SHELL" != *zsh ]]; then
	echo "Setting default shell to zsh ..."
	chsh -s $(which zsh)
else
	echo "Default shell is already zsh."
fi

echo -e "\n> Installing Oh My Zsh ..."
if [ -d "$HOME/.oh-my-zsh" ]; then
	echo "Oh My Zsh has been already installed."
else
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	ln -s ./zshrc ~/.zshrc
fi

echo -e "\n> Downloading Oh My Zsh plugins ..."
get_or_update https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
get_or_update https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
get_or_update https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use

echo -e "\n> Log out and log back in again."
