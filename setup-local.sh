#!/bin/bash

set -euo pipefail

BASEDIR=$(dirname $0)
source $BASEDIR/shared.sh

step "Install brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)
success "Done"

step "Installing development tools..."
brew install --cask iterm2
brew install --cask raycast
brew install --cask quicklook-json
brew install --cask aws-vault
brew install --cask visual-studio-code
brew install --cask intellij-idea
brew install --cask intellij-idea-ce
brew install docker
brew install git
success "Done"

step "Installing util tools..."
brew install --cask obs
brew install --cask licecap
brew install --cask rectangle
success "Done"

step "Installing communication tools..."
brew install --cask discord
brew install --cask zoom
brew install --cask linear-linear
success "Done"

step "Installing security tools..."
brew install --cask keepassxc
brew install --cask tailscale
brew install --cask cryptomator
success "Done"

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
success "Done"

echo "Optimizing mac settings..."

# snappy dock
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -float 0.4
killall Dock

# touch id for sudo
sed "s/^#auth/auth/" /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local 

success "Done"
