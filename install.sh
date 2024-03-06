#!/bin/bash

read -p "What is your email? " GIT_EMAIL

print "\nPlease wait! It will configure your environment. \n"
echo "[1/3] Creating the Projects folder..."
mkdir ~/Projects

echo "[2/3] Setting up dotfiles..."
git clone https://github.com/YasminTeles/dotfiles.git ~/.dotfiles

cd ~/.dotfiles
stow --dotfiles git

echo "[3/3] Configuring Git..."
git config --global user.email $GIT_EMAIL

printf "\nSuccess Everythings is ready!"
printf "\nHave a nice day!"
