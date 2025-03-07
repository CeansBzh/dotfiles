# Dotfiles

This repository contains my dotfiles. Managed with [chezmoi](https://www.chezmoi.io/).

## Getting started

Run the following command to install chezmoi and apply the configuration:

```bash
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply CeansBzh
```

> chezmoi will be installed in `~/.local/bin/chezmoi` and the dotfiles will be cloned in `~/.local/share/chezmoi`.

## Usage

Manage a new file:

```bash
chezmoi add ~/.config/file
```

Edit a file:

```bash
chezmoi edit --apply ~/.config/file
```

To update the repository:

```bash
chezmoi cd
git add .
git commit -m "<Your update commit message>"
git push -u origin main
```

Pull and apply the latest changes:

```bash
chezmoi update -v
```