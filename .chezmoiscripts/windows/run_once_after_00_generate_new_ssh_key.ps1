$KEYPATH = "$env:USERPROFILE\.ssh\id_ed25519"

Write-Host "Génération d'une nouvelle clé SSH pour cet appareil`n`n"

# Lecture du mot de passe désiré
$passphrase = Read-Host -AsSecureString "Entrer la phrase de passe de la nouvelle clé"
$passphrase_confirm = Read-Host -AsSecureString "Confirmer la phrase de passe"

# Si les mots de passe ne sont pas vides
$pass_text = if ($passphrase.Length -gt 0) { ConvertFrom-SecureString $passphrase -AsPlainText } else { "" }
$pass_confirm_text = if ($passphrase_confirm.Length -gt 0) { ConvertFrom-SecureString $passphrase_confirm -AsPlainText } else { "" }
if ($pass_text -ne $pass_confirm_text) {
    Write-Host "Les phrases de passe ne correspondent pas.`n`n" -ForegroundColor Red
    exit 1
}

# Lecture du commentaire désiré
$comment = Read-Host "Entrer le commentaire"

# Génération de la clé
if ($pass_text.Length -eq 0) {
    ssh-keygen -t ed25519 -C $comment -f $KEYPATH
} else {
    ssh-keygen -t ed25519 -C $comment -P $pass_text -f $KEYPATH
}

# Ajout de la clé publique au presse-papier Windows
Get-Content "$KEYPATH.pub" | Set-Clipboard

Write-Host "Clé SSH générée avec succès." -ForegroundColor Green
Write-Host "La clé publique ($KEYPATH.pub) a été ajoutée au presse-papier.`n"