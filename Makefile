.PHONY: help del ssh

help: ## Show help.
	@printf "A set of development's commands.\n"
	@printf "\nUsage:\n"
	@printf "\t make \033[36m<commands>\033[0m\n"
	@printf "\nThe Commands are:\n\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\t\033[36m%-30s\033[0m %s\n", $$1, $$2}'

del: ## delete your environment configuration
	@stow --dotfiles -D git ssh
	@rm -rf ~/Projects
	@rm -rf ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub

ssh: ## Copy the SSH public key to your clipboard.
	@pbcopy < ~/.ssh/id_ed25519.pub
	@echo "Add the SSH public key to your account on GitHub or GiLlab. See your profile settings for more information."
