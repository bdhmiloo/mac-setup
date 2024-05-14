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
# brew install docker
# brew install git
brew install --cask raycast
brew install --cask quicklook-json
success "Done"

step "Installing communication tools..."
brew install --cask discord
brew install --cask zoom
success "Done"

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
success "Done"

