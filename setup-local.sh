#!/bin/bash

set -euo pipefail

BASEDIR=$(dirname $0)
source $BASEDIR/shared.sh

step "Optimizing mac settings..."
# snappy dock
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -float 0.4
killall Dock
# reduce motion
defaults write com.apple.dock workspaces-swoosh-animation-off -bool YES
killall Dock
# touch id for sudo
sed "s/^#auth/auth/" /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local
# do not open previous previewed files (e.g. PDFs) when opening a new one
defaults write com.apple.Preview ApplePersistenceIgnoreState YES
# show Library folder
chflags nohidden ~/Library
# show hidden files
defaults write com.apple.finder AppleShowAllFiles YES
killall Finder
success "Done"

step "Install brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)
success "Done"

step "Installing development tools..."
brew install --cask iterm2
brew install --cask raycast
brew install --cask quicklook-json
brew install --cask quicklook-csv
brew install --cask aws-vault
brew install --cask session-manager-plugin
brew install --cask visual-studio-code
brew install --cask intellij-idea
brew install --cask intellij-idea-ce
brew install zsh
brew install docker
brew install git
brew install awscli
brew install bat
brew install tree
brew install gnupg
brew install pre-commit
brew install commitizen
brew install shellcheck
success "Done"

step "Installing util tools..."
brew install --cask obs
brew install --cask licecap
brew install --cask keycastr
brew install --cask rectangle
brew install --cask appcleaner
brew install --cask suspicious-package
success "Done"

step "Installing communication tools..."
brew install --cask discord
brew install --cask zoom
success "Done"

step "Installing security tools..."
brew install --cask keepassxc
brew install --cask tailscale
brew install --cask cryptomator
success "Done"

step "Installing plugins zsh..."
sh -c "$(curl -fsSL https://install.ohmyz.sh/)"

git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
echo 'source $ZSH_CUSTOM/plugins/zsh-completions/zsh-completions.plugin.zsh' >> ~/.zshrc

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
echo 'source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
echo 'source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc

git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
echo 'source $ZSH_CUSTOM/plugins/you-should-use/zsh-you-should-use.plugin.zsh' >> ~/.zshrc

git clone https://github.com/fdellwing/zsh-bat.git $ZSH_CUSTOM/plugins/zsh-bat
echo 'source $ZSH_CUSTOM/plugins/zsh-bat/zsh-bat.plugin.zsh' >> ~/.zshrc

source ~/.zshrc
success "Done"

step "Customizing zsh configurations..."
cp $BASEDIR/aliases.sh $ZSH_CUSTOM
echo 'source $ZSH_CUSTOM/aliases.sh' >> ~/.zshrc
success "Done"

step "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source ~/.zshrc
success "Done"

step "Installing pyenv..."
brew install pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
source ~/.zshrc
success "Done"

step "Installing jenv..."
brew install jenv
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(jenv init -)"' >> ~/.zshrc
source ~/.zshrc
success "Done"
