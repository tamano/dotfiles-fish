#!/bin/bash

echo "🏎 Starting Setup!"

#########################################################
echo "⏱️ Begin installing tools"
#########################################################

brew install fish
brew install git
brew install neovim
brew install tig
brew install tmux
brew install gh
brew install lsd
brew install zoxide
brew install fzf

echo "✅ Complete installing tools"

#########################################################
echo "⏱️ Begin tool's setup"
#########################################################

if ! grep -q fish /etc/shells; then
    echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells >> /dev/null
fi

if test $SHELL != "/opt/homebrew/bin/fish"; then
    echo "Change default shell to fish"
    chsh -s /opt/homebrew/bin/fish
fi

echo "✅ Complete tool's setup"

#########################################################
echo "⏱️ Begin linking dotfiles"
#########################################################
echo "✅ Complete linking dotfiles"

echo "🏁 All Complete!"
