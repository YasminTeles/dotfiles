#!/bin/bash

# Tells the shell script to exit if it encounters an error
set -e

# Print a step description
TOTAL_STEPS=8
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
  printf "\n\033[31;1m%s\n\n" "$1";
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

title_msg "This script will install your workspace."

# -- Get some information -----------------------------------------------------
if [ "$CI" = true ] ; then
  GIT_EMAIL=name@mail.com
else
  printf "Please enter some information...\n"
  read -r -p "What is your email? " GIT_EMAIL
  printf "\n"
fi

title_msg "Please wait! It will configure your workspace."

# -- Homebrew -----------------------------------------------------------------
# shellcheck disable=SC2046
if test ! $(which brew); then
  step_msg "Installing the Homebrew"
  NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" >/dev/null
else
  step_msg "Updating the Homebrew"
  brew update --force --quiet
  brew upgrade --quiet
fi

# -- Project folder -----------------------------------------------------------
step_msg "Creating the Projects folder"
mkdir ~/Projects

# -- Dependencies -------------------------------------------------------------
step_msg "Installing dependencies"
brew install git stow >/dev/null

# -- Dotfiles -----------------------------------------------------------------
step_msg "Setting up dotfiles"
git clone https://github.com/YasminTeles/dotfiles.git ~/.dotfiles >/dev/null

rm -rf ~/.gitconfig
cd ~/.dotfiles
stow --dotfiles git ssh brew

# -- Productivity Apps ---------------------------------------------------------
step_msg "Installing the productivity apps"
if [ "$CI" = true ] ; then
  brew bundle install --file=~/Brewfile
else
  brew bundle install --file=~/Brewfile >/dev/null
fi

# -- Oh My Zsh -----------------------------------------------------------------
step_msg "Installing the Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended >/dev/null
rm -rf ~/.zshrc
stow --dotfiles zsh
echo "My current shell is $SHELL."

# -- Git -----------------------------------------------------------------------
step_msg "Configuring Git"
git config --global user.email "$GIT_EMAIL"

# -- SSH Key -------------------------------------------------------------------
step_msg "Generating a new SSH key"
rm -rf ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub
ssh-keygen -t ed25519 -C "$GIT_EMAIL" -f ~/.ssh/id_ed25519 -q -N "" >/dev/null
eval "$(ssh-agent -s)" >/dev/null
ssh-add ~/.ssh/id_ed25519 >/dev/null

# -- Next Steps ----------------------------------------------------------------
printf "\n"
title_msg "Next steps:"
echo -e "- Run \033[1mmake ssh\033[0m to copy your SSH public Key and past it into your GitHub or GitLab account."
echo -e "- Run \033[1mmake zsh\033[0m to change your shell to zsh mode."

# -- Happy end -----------------------------------------------------------------
success_msg "Everything is ready!"
title_msg "Have a nice day!"
