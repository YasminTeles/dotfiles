#!/bin/bash

echo "[1/2] Creating the Projects folder..."
mkdir ~/Projects

echo "[2/2] Setting up dotfiles..."
git clone https://github.com/YasminTeles/dotfiles.git ~/.dotfiles

cd ~/.dotfiles
stow --dotfiles git

echo "Success Everythings is ready!"
echo "Have a nice day!"
