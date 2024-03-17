# Yasmin´s dotfiles

Welcome to my dotfiles repository!

This project is a curated collection of configuration files and scripts tailored to enhance my daily development experience.

My dotfiles are designed to simplify my workflow, customize my development environment, and ensure a consistent configuration.

## Installation

Insert this into a macOS Terminal or Linux shell prompt. The script will detail its actions and then halt before executing them.

```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/YasminTeles/dotfiles/main/install.sh)"
```

## What's included?

All my command-line tools, applications, and their configurations. Have fun 😎💅

- Git
- Stow
- Oh My Zsh
- SSH key generation
- Create a Projects folder
- A bunch of productivity apps. See [Brewfile](/brew/Brewfile) for more information.

## Helper

A set of environment management commands is available at `Makefile`. To access the help documentation, simply run `make help` in your terminal.

```bash
  make help
```

## Uninstall

This script is designed to remove all configurations of your environment. **Please proceed with caution** as this action is irreversible.

### Instructions

Enter this command into a macOS Terminal or Linux shell prompt. The script will outline its actions.

```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/YasminTeles/dotfiles/main/uninstall.sh)"
```

> [!CAUTION]
> Ensure you have **backups** of any important configurations before running this script.

By following these steps, you can safely remove all configurations of the environment as needed.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact me

I'm always up for a chat. If you have a question or suggestion, please get in touch with me through [my site](https://yasminteles.com).
