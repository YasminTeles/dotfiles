#!/bin/bash

# Tells the shell script to exit if it encounters an error
set -e

TOTAL_STEPS=6
STEP=1
function step_msg {
	printf "\n\033[36;1m[%s/%s] %s...\033[0m\n" "$STEP" "$TOTAL_STEPS" "$1";
  ((STEP++))
}

function title_msg {
  printf "\n%s\n" "$1";
}

# -- Get some information -----------------------------------------------------
if [ "$CI" = true ] ; then
  GIT_EMAIL=name@mail.com
else
  printf "Please enter some information.\n"
  read -r -p "What is your email? " GIT_EMAIL
fi

title_msg "Please wait! It will configure your environment."

# -- Project folder -----------------------------------------------------------
step_msg "Creating the Projects folder"
mkdir ~/Projects

# -- Dependencies -------------------------------------------------------------
step_msg "Installing dependencies"
brew install git stow

# -- Dotfiles -----------------------------------------------------------------
step_msg "Setting up dotfiles"
git clone https://github.com/YasminTeles/dotfiles.git ~/.dotfiles

rm -rf ~/.gitconfig
cd ~/.dotfiles
stow --dotfiles git ssh brew

# -- Productivity Apps ---------------------------------------------------------
step_msg "Installing the productivity apps"
brew bundle install --file=~/Brewfile

# -- Git -----------------------------------------------------------------------
step_msg "Configuring Git"
git config --global user.email "$GIT_EMAIL"

# -- SSH Key -------------------------------------------------------------------
step_msg "Generating a new SSH key"
rm -rf ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub
ssh-keygen -t ed25519 -C "$GIT_EMAIL" -f ~/.ssh/id_ed25519 -q -N ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# -- Next Steps ----------------------------------------------------------------
echo -e "\n"
title_msg "Next steps:"
echo -e "- Run \033[1mmake ssh\033[0m to copy your SSH public Key and past it into your GitHub or GitLab account."

# -- Happy end -----------------------------------------------------------------
printf "\n\nSuccess: Everything is ready!"
printf "\nHave a nice day!\n"
