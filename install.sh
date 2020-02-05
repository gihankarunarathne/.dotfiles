#!/usr/bin/env bash

command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "Installing dotfiles."

source install/link.sh

# only perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\\n\\nRunning on macOS"

    # after the install, install neovim python libraries
    echo -e "\\n\\nRunning Neovim Python install"
    echo "=============================="
    pip3 install pynvim

fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

echo "Done. Reload your terminal."

