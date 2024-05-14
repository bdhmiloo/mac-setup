#!/bin/bash

set -euo pipefail

BASEDIR=$(dirname $0)
source $BASEDIR/shared.sh

step "Installing vs code extensions..."

code --install-extension rangav.vscode-thunder-client
code --install-extension 42crunch.vscode-openapi
code --install-extension aaravb.chrome-extension-developer-tools
code --install-extension andys8.jest-snippets
code --install-extension bierner.markdown-mermaid
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension davidanson.vscode-markdownlint
code --install-extension dbaeumer.vscode-eslint
code --install-extension donjayamanne.githistory
code --install-extension dotjoshjohnson.xml
code --install-extension eamodio.gitlens
code --install-extension editorconfig.editorconfig
code --install-extension eg2.vscode-npm-script
code --install-extension esbenp.prettier-vscode
code --install-extension firsttris.vscode-jest-runner
code --install-extension formulahendry.code-runner
code --install-extension liamhammett.inline-parameters
code --install-extension mhutchie.git-graph
code --install-extension mikestead.dotenv
code --install-extension ms-azuretools.vscode-docker
code --install-extension naumovs.color-highlight
code --install-extension orta.vscode-jest
code --install-extension redhat.vscode-yaml
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension sonarsource.sonarlint-vscode
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension visualstudioexptteam.intellicode-api-usage-examples
code --install-extension visualstudioexptteam.vscodeintellicode
code --install-extension vitest.explorer
code --install-extension vscode-icons-team.vscode-icons
code --install-extension wayou.vscode-todo-highlight
code --install-extension wix.vscode-import-cost
code --install-extension zignd.html-css-class-completion

success "Done"
