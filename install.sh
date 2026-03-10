#!/usr/bin/env bash

set -e

echo "Installing dotfiles..."

# Create config directories
mkdir -p ~/.config

# Symlink configs
ln -sf $(pwd)/nvim ~/.config/nvim
ln -sf $(pwd)/zsh/zshrc ~/.zshrc

echo "Dotfiles installed!"
