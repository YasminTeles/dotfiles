.PHONY: help del ssh backup

help: ## Show help.
	@printf "A set of environment management commands.\n"
	@printf "\nUsage:\n"
	@printf "\t make \033[36m<commands>\033[0m\n"
	@printf "\nThe Commands are:\n\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\t\033[36m%-30s\033[0m %s\n", $$1, $$2}'

del: ## Delete your development environment.
	@echo "Deleting all dotfiles, applications, and folders..."
	@stow --dotfiles -D git ssh brew
	@rm -rf ~/Projects
	@rm -rf ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub
	@brew uninstall --force $(shell brew list)
	@NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

ssh: ## Copy the SSH public key to your clipboard.
	@pbcopy < ~/.ssh/id_ed25519.pub
	@echo "The SSH public key is available in your clipboard."
	@echo "Add the SSH public key to your account on GitHub or GitLab. See your profile settings for more information."

backup: ## Back up your applications list.
	@echo "Backing up your applications list..."
	@brew bundle dump --file=./brew/Brewfile --force
