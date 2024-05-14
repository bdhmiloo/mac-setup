#!/bin/bash

set -euo pipefail

BASEDIR=$(dirname $0)
source $BASEDIR/shared.sh

step "Installing vs code extensions..."
code --install-extension rangav.vscode-thunder-client
success "Done"
