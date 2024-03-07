#!/bin/bash

# Tells the shell script to exit if it encounters an error
set -e

TOTAL_STEPS=6
STEP=1
function step_msg {
	echo  "[$STEP/$TOTAL_STEPS] $1...";
  ((STEP++))
}

# -- Get some information -----------------------------------------------------
printf "Please enter some information.\n"
read -p "What is your email? " GIT_EMAIL

printf "\nPlease wait! It will configure your environment.\n"

# -- Essential packages --------------------------------------------------------
step_msg "Installing the essential packages"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  eval apt update
  eval apt upgrade -y
  eval apt-get install build-essential -y
else
  xcode-select — install
fi

# -- Project folder -----------------------------------------------------------
step_msg "Creating the Projects folder"
mkdir ~/Projects

# -- Homebrew -----------------------------------------------------------------
step_msg "Installing homebrew"
brew update
brew install git stow

# -- Dotfiles -----------------------------------------------------------------
step_msg "Setting up dotfiles"
git clone https://github.com/YasminTeles/dotfiles.git ~/.dotfiles

cd ~/.dotfiles
stow --dotfiles git ssh brew

# -- Productivity Apps ---------------------------------------------------------
step_msg "Installing the productivity apps"
brew bundle install --file=~/Brewfile

# -- Git -----------------------------------------------------------------------
step_msg "Configuring Git"
git config --global user.email $GIT_EMAIL

# -- SSH Key -------------------------------------------------------------------
step_msg "Generating a new SSH key"
rm -rf ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub
ssh-keygen -t ed25519 -C $GIT_EMAIL -f ~/.ssh/id_ed25519 -q -N ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo "Warning: You must add the SSH public key to your account on GitHub or GitLab. For more information, see make ssh"

# -- Happy end -----------------------------------------------------------------
printf "\nSuccess: Everything is ready!"
printf "\nHave a nice day!\n"
