#!/bin/bash

echo "Importing iTerm2 settings ..."

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/iterm"

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Don’t display the annoying prompt when quitting iTerm2
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
