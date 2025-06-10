#!/bin/bash

# Tells the shell script to exit if it encounters an error
set -e

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
# osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Print a step description
TOTAL_STEPS=13
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

# -- 1. Homebrew -----------------------------------------------------------------
# shellcheck disable=SC2046
if test ! $(which brew); then
  step_msg "Installing the Homebrew"
  NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  step_msg "Updating the Homebrew"
  brew update --force --quiet
  brew upgrade --quiet
fi

# -- 2. Project folder -----------------------------------------------------------
step_msg "Creating the Projects folder"

if [ ! -d "$HOME/Projects" ]; then
  mkdir ~/Projects
fi

# -- 3. Dependencies -------------------------------------------------------------
step_msg "Installing dependencies"

brew install git stow

# -- 4. Dotfiles -----------------------------------------------------------------
step_msg "Setting up dotfiles"

if [ ! -d "$HOME/.dotfiles" ]; then
  git clone https://github.com/YasminTeles/dotfiles.git ~/.dotfiles
fi

# -- 5. Productivity Apps ---------------------------------------------------------
step_msg "Installing the productivity apps"

cd ~/.dotfiles && stow brew

brew bundle check || brew bundle install --file=~/Brewfile --force

# -- 6. Oh My Zsh -----------------------------------------------------------------
step_msg "Installing the Oh My Zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

rm -rf ~/.zshrc
cd ~/.dotfiles && stow zsh

# -- 7. Set up the zsh as default shell -------------------------------------------
step_msg "Setting up the zsh as default shell"

echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells
sudo chsh -s "$(brew --prefix)/bin/zsh" "$USER"

# -- 8. Set up the bat theme ------------------------------------------------------
step_msg "Setting up the bat theme"

if [ ! -d "$(bat --config-dir)/themes" ]; then
  mkdir -p "$(bat --config-dir)/themes"
fi

cd "$(bat --config-dir)/themes" && curl --remote-name-all https://raw.githubusercontent.com/rose-pine/tm-theme/main/dist/themes/rose-pine{,-dawn,-moon}.tmTheme
bat cache --build

# -- 9. Set up the iTerm2 ---------------------------------------------------------
step_msg "Setting up the iTerm2"

sh ~/.dotfiles/iterm/settings.sh

# -- 10. Set up the macos ---------------------------------------------------------
step_msg "Setting up the macos"

sh ~/.dotfiles/macos/defaults.sh

# -- 11. Set up fonts -------------------------------------------------------------
step_msg "Setting up the custom fonts"

cd ~/.dotfiles && stow -t ~/Library/Fonts fonts

# -- 12. Git ----------------------------------------------------------------------
step_msg "Configuring Git"

rm -rf ~/.gitconfig
cd ~/.dotfiles && stow --dotfiles git

git config --global user.email "$GIT_EMAIL"

# -- 13. SSH Key ------------------------------------------------------------------
step_msg "Generating a new SSH key"

cd ~/.dotfiles && stow ssh

rm -rf ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub
ssh-keygen -t ed25519 -C "$GIT_EMAIL" -f ~/.ssh/id_ed25519 -q -N ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# -- Next Steps ----------------------------------------------------------------
printf "\n"
title_msg "Next steps:"

echo -e "- Run \033[1mmake ssh\033[0m to copy your SSH public Key and past it into your GitLab account."
echo -e "- If you will use GitHub, run \033[1mmake github\033[0m to clone all GitHub repository for Projects directory."

# -- Happy end -----------------------------------------------------------------
success_msg "Everything is ready!"
title_msg "Have a nice day!"
