# Cherche un dossier sur les disques de l'ordinateur : le serveur CoA ou le dossier du jeu.
# Usage : trouver.ps1 serveur | jeu      (affiche le premier dossier trouve, ou rien)
param([Parameter(Mandatory = $true)][ValidateSet("serveur", "jeu")][string]$Mode)

$ErrorActionPreference = "SilentlyContinue"
$roots = Get-PSDrive -PSProvider FileSystem | ForEach-Object { $_.Root } | Where-Object { Test-Path $_ }

function Test-Serveur($dir) { Test-Path (Join-Path $dir "Scripts\manage.py") }
function Test-Jeu($dir) {
    (Test-Path (Join-Path $dir "Data")) -and (Test-Path (Join-Path $dir "Interface")) -and
    ((Test-Path (Join-Path $dir "Wow.exe")) -or (Test-Path (Join-Path $dir "WoW.exe")) -or (Test-Path (Join-Path $dir "Ascension.exe")))
}

$depth = if ($Mode -eq "serveur") { 3 } else { 4 }
foreach ($root in $roots) {
    $dirs = @(Get-Item $root) + @(Get-ChildItem $root -Directory -Depth $depth -Force)
    foreach ($dir in $dirs) {
        if ($dir.FullName -match '\\(Windows|Program Files|Program Files \(x86\)|ProgramData|\$Recycle\.Bin)(\\|$)') { continue }
        $found = if ($Mode -eq "serveur") { Test-Serveur $dir.FullName } else { Test-Jeu $dir.FullName }
        if ($found) { Write-Output $dir.FullName; exit 0 }
    }
}
