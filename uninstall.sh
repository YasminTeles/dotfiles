#!/bin/bash

# Tells the shell script to exit if it encounters an error
set -e

# Print a step description
TOTAL_STEPS=6
STEP=1
function step_msg {
	printf "\033[36;1m[%s/%s] %s...\033[0m\n" "$STEP" "$TOTAL_STEPS" "$1";
  ((STEP++))
}

function title_msg {
  printf "\033[35;1m%s\033[0m\n\n" "$1";
}

function success_msg {
  printf "\n\033[32;1m%s\n\n" "$1";
}

function error_msg {
  printf "\033[31;1m%s\n\n" "$1";
}


# -- Getting Started ----------------------------------------------------------

printf "\n"
printf "\033[36;1m██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗\n"
printf "\033[36;1m██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝\n"
printf "\033[36;1m██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗\n"
printf "\033[36;1m██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║\n"
printf "\033[36;1m██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║\n"
printf "\033[36;1m╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝\n"
printf "\n"

title_msg "This script will remove your workspace."

if [ ! "$CI" ]
then
  read -r -p "Are you sure you want to proceed? (y/n) " CONFIRM
  printf "\n"
fi

if [[ "$CI" || "$CONFIRM" == [yY] || "$CONFIRM" == [yY][eE][sS] ]]
then
  title_msg "Please wait! Proceeding to remove your workspace..."

  # -- Symlinks ----------------------------------------------------------------
  step_msg "Removing all symlinks"
  cd ~/.dotfiles && stow --dotfiles -D git ssh brew zsh gh-dash

  # -- Project folder ----------------------------------------------------------
  step_msg "Removing the Project directory"
  rm -rf ~/Projects

  # -- SSH Key -----------------------------------------------------------------
  step_msg "Removing SSH Keys"
  rm -rf ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub

  # -- Productivity Apps -------------------------------------------------------
  step_msg "Removing all productivity apps"
  # shellcheck disable=SC2046
  brew uninstall --force $(brew list) >/dev/null
  rm -rf ~/.oh-my-zsh
  rm -rf ~/Brewfile.lock.json

  # -- Homebrew ----------------------------------------------------------------
  step_msg "Removing the Homebrew"
  NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)" >/dev/null

  # -- Dotfiles ----------------------------------------------------------------
  step_msg "Removing Dotfiles directory"
  rm -rf ~/.dotfiles

# -- Happy end -----------------------------------------------------------------
  success_msg "The workspace have been removed."

else
  error_msg "Operation cancelled."
fi

title_msg "Have a nice day!"

