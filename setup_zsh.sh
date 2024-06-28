#!/usr/bin/env bash

# Define a function to check whether a folder exists
get_or_update() {
        # Accept folder path as argument
        local git_path="$1"
        local folder_path="$2"
        echo "Downloading $git_path to $folder_path"

        # Check if the folder exists
        if [ -d "$folder_path" ]; then
                echo "Folder $folder_path exists. Updating ..."
                cd $folder_path
                git pull
        else
                echo "Getting plugin $git_path"
                git clone $git_path $folder_path
        fi
}

cur_path=$(
	exec 2>/dev/null
	cd -- $(dirname "$0")
	unset PWD
	/usr/bin/pwd || /bin/pwd || pwd
)

#=======================================================
echo "> Installing zsh ..."
#https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
# Check the system type
if [[ "$(uname)" == "Darwin" ]]; then
	# macOS
	echo "Detected macOS. Installing with Homebrew..."
	brew update
	brew install zsh thefuck fzf tmux
elif [[ "$(uname)" == "Linux" ]]; then
	# Linux
	if [ -x "$(command -v apt)" ]; then
		# Ubuntu and Debian-based
		echo "Detected Ubuntu or Debian-based system. Installing with apt..."
		sudo apt update
		sudo apt install zsh curl python3-dev python3-pip python3-setuptools thefuck fzf tmux -y
	else
		echo "Unsupported Linux distribution. Please install manually."
		exit 1
	fi
else
	echo "Unsupported operating system. Please install manually."
	exit 1
fi
zsh --version



echo -e "\n> Installing Oh My Zsh ..."
if [ -d "$HOME/.oh-my-zsh" ]; then
	echo "Oh My Zsh has been already installed."
else
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo -e "\n> Downloading Oh My Zsh plugins ..."
get_or_update https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
get_or_update https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
get_or_update https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use

echo -e "\n> Updating zshrc ..."
cat ~/.zshrc >~/.zshrc.old
rm ~/.zshrc
ln -s $cur_path/zshrc ~/.zshrc

# Check if the default shell is Zsh or Bash
if [[ "$SHELL" != *zsh ]]; then
	echo "Setting default shell to zsh ..."
	chsh -s $(which zsh)
else
	echo "Default shell is already zsh."
fi

echo -e "\n> Log out and log back in again."