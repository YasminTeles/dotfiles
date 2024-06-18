![My dotfiles is now installed!](/images/banner.webp "My dotfiles is now installed!")

# Yasmin's dotfiles

Welcome to my dotfiles repository!

My dotfiles are designed to simplify my workflow, customize my development environment, and improve my daily development experience.

> [!WARNING]
> I use this project to save my configuration files for personal use. Some of them may not work for you.

Are you curious about dotfiles? Check out the guide [Customize, Simplify, and Automate Your Workspace With Dotfiles](https://yasminteles.com/blog/customize-simplify-and-automate-your-workspace-with-dotfiles).

Feel free to explore, adapt, and copy parts of these dotfiles into your own dotfiles. Enjoy the customization journey!

## Screenshots

![Terminal](/images/terminal.webp "Terminal")

## Installation

Insert this into a macOS terminal. The script will detail its actions and then halt before executing them.

```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/YasminTeles/dotfiles/main/install.sh)"
```

## What's included?

All my command-line tools, applications, and their configurations. Have fun 😎💅

- iTerm with rose-pine moon theme.
- zsh and Oh My Zsh with Spaceship theme.
- Git and SSH key generation. See [gitconfig](/git/.gitconfig) for more information about my Git aliases.
- Create a Projects folder. For clone all projects in GitHub, try `make github`.
- Homebrew and a bunch of productivity apps. See [Brewfile](/brew/Brewfile) for more information.

## Helper

A set of environment management commands is available at `Makefile`. To access the help documentation, simply run `make help` in your terminal.

```bash
  make help
```

## Uninstall

This script is designed to remove all configurations of your environment. **Please proceed with caution** as this action is irreversible.

> [!CAUTION]
> Ensure you have **backups** of any important configurations before running this script.

Enter this command into a macOS terminal. The script will outline its actions.

```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/YasminTeles/dotfiles/main/uninstall.sh)"
```

## License

This project is licensed under the [MIT License](LICENSE).

## Contact me

I'm always up for a chat. If you have a question or suggestion, please get in touch with me through [my site](https://yasminteles.com).
