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

### Secrets

Secrets are stored in Bitwarden and imported locally in `~/.chezmoidata/secrets.yml` using the `dotfiles-secrets` tool. This allows updates of the secrets without having to update the dotfiles, and the other way around. The idea and code for this system is taken from [this article by Mike Kasberg](https://www.mikekasberg.com/blog/2026/01/31/dotfiles-secrets-in-chezmoi.html).

Unlock the vault and export the session key:

```bash
export BW_SESSION="$(bw-open)"
```

Update the cached secrets:

```bash
dotfiles-secrets install
```

Show diff between the cached secrets and the Bitwarden vault:

```bash
dotfiles-secrets diff
```