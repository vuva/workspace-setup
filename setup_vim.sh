sudo apt install -y vim ripgrep
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -sL install-node.now.sh/lts | sudo bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
#echo "[ -f ~/.fzf.bash ] && source ~/.fzf.bash" >> ~/.bashrc
cp .vimrc ~/
vim +PluginInstall +qall