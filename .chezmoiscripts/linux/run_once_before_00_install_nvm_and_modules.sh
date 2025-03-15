#!/bin/bash

# Check if NVM is already installed
if [ ! -d "$HOME/.nvm" ]; then
  # Download and install NVM
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

  # Load NVM for immediate use
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

  # Install the latest version of Node.js
  nvm install node
fi

# Install bitwarden
pack='@bitwarden/cli'
npm list -g | grep -q $pack || npm install -g $pack --no-shrinkwrap