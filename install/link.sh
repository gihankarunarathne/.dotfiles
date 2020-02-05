#!/user/bin/env bash

DOTFILES=$HOME/.dotfiles

echo -e "\\n\\nInstalling to ~/.config"
echo "================================"
if [ ! -d "$HOME/config" ]; then
    echo "Creating ~/.config"
    mkdir -p "$HOME/.config"
fi

config_files=$(find "$DOTFILES/config" -maxdepth 1 2>/dev/null)
for config in $config_files; do
    target="$HOME/.config/$(basename "$config")"
    if [ -e "$target" ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating simlink for $config"
        ln -s "$config" "$target"
    fi
done

