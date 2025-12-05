# Run command
# curl -fsSL https://raw.githubusercontent.com/agsheves/mac-setup/main/scripts/bootstrap.sh | bash

#!/usr/bin/env bash
set -e

echo "=== Installing Homebrew ==="
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "=== Updating Homebrew ==="
brew update

echo "=== Installing core tools ==="
brew install git
brew install tree
brew install htop
brew install jq
brew install wget
brew install ffmpeg

echo "=== Installing Python versions ==="
brew install python@3.9
brew install python@3.12

echo 'export PATH="/opt/homebrew/opt/python@3.9/bin:$PATH"' >> ~/.zprofile
source ~/.zprofile

echo "=== Installing pipx ==="
brew install pipx
pipx ensurepath

echo "=== Installing Node + nvm ==="
brew install nvm
mkdir -p ~/.nvm
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zprofile
echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"' >> ~/.zprofile
source ~/.zprofile

echo "Installing Node LLS"
nvm install --lts
nvm use --lts

echo "=== Installing LiveKit CLI ==="
brew install livekit/livekit/livekit

echo "=== Installing pm2 (global) ==="
npm install -g pm2

echo "=== Installing Ollama ==="
brew install ollama

echo "=== Installing Docker Desktop ==="
brew install --cask docker

echo "=== Installing GitHub CLI ==="
brew install gh

echo "=== Installing Brave Browser ==="
brew install --cask brave-browser

echo "=== Installing Cursor ==="
brew install --cask cursor

echo "=== Bootstrap complete! ==="
echo "Open a new terminal for all changes to take effect."

