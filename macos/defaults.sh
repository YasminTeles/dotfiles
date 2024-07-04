#!/bin/bash

echo "Setting up macos..."

# Disable the system UI sound effects
defaults write com.apple.systemsound "com.apple.sound.uiaudio.enabled" -int 0
