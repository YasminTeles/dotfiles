#!/bin/bash

# Tells the shell script to exit if it encounters an error
set -e

read -p "What is your email? " GIT_EMAIL

printf "\nPlease wait! It will configure your environment.\n"
echo "[1/4] Creating the Projects folder..."
mkdir ~/Projects

echo "[2/4] Setting up dotfiles..."
git clone https://github.com/YasminTeles/dotfiles.git ~/.dotfiles

cd ~/.dotfiles
stow --dotfiles git ssh

echo "[3/4] Configuring Git..."
git config --global user.email $GIT_EMAIL

echo "[4/4] Generating a new SSH key..."
rm -rf ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub
ssh-keygen -t ed25519 -C $GIT_EMAIL -f ~/.ssh/id_ed25519 -q -N ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo "Warning: You must add the SSH public key to your account on GitHub or GitLab. For more information, see make ssh"

printf "\nSuccess: Everything is ready!"
printf "\nHave a nice day!\n"
