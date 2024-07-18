#!/bin/bash

echo "Setting up macos..."

###############################################################################
# Screenshots                                                                 #
###############################################################################

# Disable the system UI sound effects.
defaults write com.apple.systemsound "com.apple.sound.uiaudio.enabled" -int 0

# Remove the default shadow from screenshots.
defaults write com.apple.screencapture "disable-shadow" -bool "true"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"
