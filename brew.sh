#!/bin/sh

sudo -v
while true; do sudo -n true; sleep 6000; kill -0 "$$" || exit; done 2>/dev/null &

# TAPS
brew tap homebrew/dupes
brew tap homebrew/fuse
brew tap homebrew/science
brew tap ravenac95/sudolikeaboss

brew tap caskroom/versions
brew tap caskroom/fonts

brew tap neovim/neovim

# Casks symlink in applications folder
ln -sf /opt/homebrew-cask/Caskroom /Applications/Caskroom

# Make sure up to date
brew update
brew doctor
brew upgrade --all

# Fetch Brews
cat ~/.dotfiles/Brewfile | grep '^brew install' | sed 's/^brew install //' | sed -e 's/ .*$//' | parallel --bar -j3 \
  "brew fetch {}"

# Fetch Casks
cat ~/.dotfiles/Caskfile | grep '^brew cask install' | sed 's/^brew cask install //' | sed -e 's/ .*$//' | parallel --bar -j3 \
  "brew cask fetch {}"

# Install Brews
cat ~/.dotfiles/Brewfile | grep '^brew install' | parallel --bar --timeout 300 -j 1 \
  "echo {}; sudo xcodebuild -license accept; eval {}"

# Install Casks
cat ~/.dotfiles/Caskfile | grep '^brew cask' | parallel --bar -j3 \
  "echo {}; eval {}"

# Cleanup
brew cleanup -s
brew cask cleanup
