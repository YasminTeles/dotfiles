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

# Restart Finder
killAll Finder

###############################################################################
# Dock                                                                        #
###############################################################################

# Add my favorite applications in the Dock
dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Spotify.app"
dockutil --no-restart --add "/Applications/Notion.app"
dockutil --no-restart --add "/Applications/Notion Calendar.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/iTerm.app"

# Set the icon size of Dock items to 56 pixels
defaults write com.apple.dock tilesize -int 56

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool false

# Show recent applications in Dock
defaults write com.apple.dock "show-recents" -bool false

# Restart Dock
killall Dock
