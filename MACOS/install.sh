#!/bin/bash

brew install --cask nikitabobko/tap/aerospace
brew tap FelixKratz/formulae
brew install sketchybar
brew install --cask font-hack-nerd-font
brew install --cask font-sketchybar-app-font
brew install --cask marta
brew install --cask sol
brew install --cask raycast
# install dependencies with Homebrew
brew install openssl@3 readline libyaml gmp autoconf

brew install $(cat brew.txt)

mkdir ~/.config 
cp -R ./config/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml
cp -R config/alacritty ~/.config/alacritty/aerospace.toml
cp -R config/sketchybar ~/.config/sketchybar
cp -R config/marta ~/.config/marta
cp zshrc ~/.zshrc
cp p10k.zsh ~/.p10k.zsh

xcode-select --install

rm ~/Library/Application\ Support/org.yanex.marta/conf.marco
ln -s ~/.config/marta/conf.marco ~/Library/Application\ Support/org.yanex.marta/conf.marco

defaults write com.apple.dock autohide -bool true && killall Dock
defaults write com.apple.dock no-bouncing -bool TRUE && killall Dock
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g NSWindowShouldDragOnGesture -bool true

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/simonas-dev/android-ohmyzsh.git ~/.oh-my-zsh/custom/plugins/android --depth=1
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

asdf plugin add ruby
asdf plugin add nodejs
asdf plugin add java
asdf plugin add php

chsh -s /bin/zsh

mkdir ~/.gnupg
echo "pinentry-program /opt/homebrew/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf

echo "Reload your terminal"