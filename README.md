# Dotfiles

This repository contains my dotfiles. Managed with [chezmoi](https://www.chezmoi.io/).

## Getting started

>If using WSL make sure to install the Dotfiles on Windows first

Run the following command to install chezmoi and apply the configuration:

Windows:
```powershell
Set-ExecutionPolicy RemoteSigned –Scope Process
iex "&{$(irm 'https://get.chezmoi.io/ps1')} -- init --apply --ssh --depth 1 --purge-binary CeansBzh" // TODO: Test this command

Set-Service ssh-agent -StartupType Manual
Start-Service ssh-agent
Ssh-Add "$env:USERPROFILE/.ssh/id_ed25519"
```

Linux:
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