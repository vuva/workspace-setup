#!/bin/sh

sudo apt install -y vim ripgrep screen universal-ctags
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -sL install-node.now.sh/lts | sudo bash
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
#echo "[ -f ~/.fzf.bash ] && source ~/.fzf.bash" >> ~/.bashrc
cp .vimrc ~/
#vim +PluginInstall +qall
vim +PlugInstall +qall