#!/bin/bash

### References:
# https://github.com/frankroeder/dotfiles/blob/master/macos/finder.bash
# https://github.com/mathiasbynens/dotfiles/blob/main/.macos

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

################################################################################
# Finder                                                                       #
################################################################################

# loggedInUser=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`

# # sfltool nao funciona mais...
# if [ -e /usr/bin/sfltool ] ;then
#   echo "$loggedInUser"
#   # Add Projects to Finder Favorites sidebar.
#   sfltool add-item com.apple.LSSharedFileList.FavoriteItems file:///Users/$loggedInUser/Projects && sleep 2

#   # Add User folder to Finder Favorites sidebar.
#   sfltool add-item com.apple.LSSharedFileList.FavoriteItems file:///Users/$loggedInUser && sleep 2

#   touch /Users/$loggedInUser/.sidebarshortcuts
# fi

# Show hidden files by default.
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all filename extensions.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable recent tags section in Finder.
defaults write com.apple.Finder ShowRecentTags -bool false

# Restarts cfprefsd and Finder
killAll cfprefsd
killAll Finder
