xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew install python
brew install python3
pip2 install neovim --upgrade
pip3 install neovim --upgrade
sudo pip3 install themis
brew install zsh
brew install gpg
brew install the_silver_searcher
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh
brew install neovim
mkdir -p ~/.config/nvim/
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -OJL https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Bold.ttf
mkdir projects
cd projects
git clone git@github.com:Highstead/Tools.git
git clone git://github.com/altercation/vim-colors-solarized.git
go get golang.org/x/tools/cmd/goimports

# TODO add compile and move goimports and gocode
mkdir -p ~/.config/nvim/
mv vim-colors-solarized/colors ~/.config/nvim/colors/
 " mv vim-colors-solarized ~/.vim/bundle

 ln -s ~/projects/Tools/dotfiles/mac.zshrc ~/.zshrc
ln -s ~/projects/Tools/dotfiles/mac_nvimrc ~/.config/nvim/init.vim
ln -s projects/Tools/dotfiles/mac.gitignore_global ~/.gitignore

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein-installer.sh
chmod 755 dein-installer.sh
./dein-installer.sh $HOME/.nvim/repos/github.com/Shougo/dein.vim

git config --global core.editor "nvim"
git config --global core.excludesfile ~/.gitignore
