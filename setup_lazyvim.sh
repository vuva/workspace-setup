sudo apt update
sudo apt install xclip xsel ripgrep fd-find
sudo snap refresh
sudo snap install nvim --classic

# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim/

rm -rf ~/.config/nvim/.git
