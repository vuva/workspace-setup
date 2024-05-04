echo "Installing zsh"
#https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
sudo apt update
sudo apt install zsh thefuck fzf tmux
zsh --version
chsh -s $(which zsh)

echo "Installing Oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s ./zshrc ~/.zshrc

echo "Downloading Oh my zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use

echo "Log out and log back in again"
