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
brew install anyenv

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

anyenv install --init

echo "✅ Complete tool's setup"

#########################################################
echo "⏱️ Begin linking dotfiles"
#########################################################

CURRENT_DIR=`pwd`

for FILE_NAME in `ls -1A $CURRENT_DIR/dotfiles/`; do
    ORIGINAL_FILE="${CURRENT_DIR}/dotfiles/${FILE_NAME}"
    TARGET_LINK="${HOME}/${FILE_NAME}"

    if [ -e $TARGET_LINK ]; then
        echo "[skip] ${TARGET_LINK} already exists"
    else
        ln -s $ORIGINAL_FILE $TARGET_LINK
        echo "[link] ${TARGET_LINK} created"
    fi
done

echo "✅ Complete linking dotfiles"

#########################################################
echo "⏱️ Begin linking .config"
#########################################################

CURRENT_DIR=`pwd`

for DIR_NAME in `ls -1A $CURRENT_DIR/dotconfig/`; do
    ORIGINAL_DIR="${CURRENT_DIR}/dotconfig/${DIR_NAME}"
    TARGET_LINK="${HOME}/.config/${DIR_NAME}"

    if [ -e $TARGET_LINK ]; then
        echo "[skip] ${TARGET_LINK} already exists"
    else
        ln -s $ORIGINAL_DIR $TARGET_LINK
        echo "[link] ${TARGET_LINK} created"
    fi
done

echo "✅ Complete linking .config"

echo "🏁 All Complete!"
