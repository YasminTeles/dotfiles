#!/bin/bash

# Tells the shell script to exit if it encounters an error
set -e

# Print a step description
TOTAL_STEPS=5
STEP=1
function step_msg {
	printf "\n\033[36;1m[%s/%s] %s...\033[0m\n" "$STEP" "$TOTAL_STEPS" "$1";
  ((STEP++))
}

echo "This script will remove all configurations of the environment."

if [ ! "$CI" ]
then
  read -r -p "Are you sure you want to proceed? (y/n) " CONFIRM
fi

if [[ "$CI" || "$CONFIRM" == [yY] || "$CONFIRM" == [yY][eE][sS] ]]
then
  printf "\nPlease wait! Proceeding with the removal of all configurations...\n"

  # -- Symlinks ----------------------------------------------------------------
  step_msg "Removing all symlinks"
  cd ~/.dotfiles && stow --dotfiles -D git ssh brew zsh

  # -- Project folder ----------------------------------------------------------
  step_msg "Removing the Project directory"
  rm -rf ~/Projects

  # -- SSH Key -----------------------------------------------------------------
  step_msg "Removing SSH Keys"
  rm -rf ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub

  # -- Productivity Apps -------------------------------------------------------
  step_msg "Removing all productivity apps"
  brew uninstall --force "$(brew list)"
  rm -rf ~/.oh-my-zsh
  rm -rf ~/Brewfile.lock.json

  # -- Dotfiles ----------------------------------------------------------------
  step_msg "Removing Dotfiles directory"
  rm -rf ~/.dotfiles

# -- Happy end -----------------------------------------------------------------
  printf "\nAll configurations have been removed."

else
  printf "\nOperation cancelled."
fi

printf "\nHave a nice day!\n"

