if (-not (Get-Command bw -ErrorAction SilentlyContinue)) {
    Write-Output "Bitwarden CLI n'est pas installé. Veuillez l'installer avant de continuer."
    exit 1
}

if (bw login --check -ErrorAction SilentlyContinue) {
    exit 0
}

$env:BW_SESSION = bw login {{ .email }} --raw
