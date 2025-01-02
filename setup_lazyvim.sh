sudo apt update
sudo apt install xclip xsel ripgrep fd-find npm nodejs fzf git
sudo snap refresh
sudo snap install nvim --classic

# Ubuntu 24
sudo apt install python3-venv python3-pynvim 

# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/vuva/lazyvim-starter.git ~/.config/nvim/

# rm -rf ~/.config/nvim/.git
