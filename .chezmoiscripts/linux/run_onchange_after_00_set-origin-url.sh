#!/bin/bash

set -eufo pipefail

git -C "${CHEZMOI_WORKING_TREE}" remote set-url origin git@github.com:CeansBzh/dotfiles.git