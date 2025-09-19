.PHONY: help check_clean del ssh backup github gh-dash gh-login colima check-scripts macos fonts

help: ## Show help.
	@printf "A set of environment management commands.\n"
	@printf "\nUsage:\n"
	@printf "\t make \033[36m<commands>\033[0m\n"
	@printf "\nThe Commands are:\n\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\t\033[36m%-30s\033[0m %s\n", $$1, $$2}'

check_clean:
	@echo -n "Are you sure you want to remove all configurations? [y/N] " && read ans && [ $${ans:-N} = y ]

del: check_clean ## Delete your development environment.
	@echo "Deleting all dotfiles, applications, and folders..."
	@stow --dotfiles -D git ssh brew zsh gh-dash gemini k9s vim
	@rm -rf ~/Projects
	@rm -rf ~/Documents/*
	@rm -rf ~/Downloads/*
	@rm -rf ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub
	@rm -rf ~/.oh-my-zsh
	@brew uninstall --force $(shell brew list)
	@NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)"

ssh: ## Copy the SSH public key to your clipboard.
	@pbcopy < ~/.ssh/id_ed25519.pub
	@echo "The SSH public key is available in your clipboard."
	@echo "Add the SSH public key to your account on GitLab. See your profile settings for more information."

backup: ## Back up your applications list.
	@echo "Backing up your applications list..."
	@brew bundle dump --file=./brew/Brewfile --force

github: gh-dash gh-login ## Clone all projects of a username at once in Github.
	@echo "Please enter some information"
	@read -r -p "What is the organization or user name? " owner; \
	read -r -p "What is the topic? " topic; \
	cd ~/Projects && gh repo list $$owner --limit 4000 --no-archived --topic $$topic | while read -r repository _; do gh repo clone $$repository ; done
	@echo "Check the Projects folder to view all cloned projects."

gh-dash: ## Install gh-dash extension.
	@gh extension install dlvhdr/gh-dash
	@stow gh-dash

gh-login: ## Login to GitHub.
	@gh auth login --git-protocol ssh --web

colima: ## Setting up Colima and create a docker compose plugin.
	brew uninstall docker-desktop
	stow docker
	brew services start colima

check-scripts: ## Check the shell script.
	@echo "Checking the shell script..."
	@shellcheck *.sh

macos: ## Setting up MacOS
	@sh ~/.dotfiles/iterm/settings.sh
	@sh ~/.dotfiles/macos/defaults.sh

fonts: ## Setting up custom fonts.
	@stow -t ~/Library/Fonts fonts
