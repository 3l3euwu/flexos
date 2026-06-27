# FlexOS Windows Build Assistant
# Push vers GitHub Actions pour build automatique

Write-Host "╔═══════════════════════════════════════════╗" -ForegroundColor Magenta
Write-Host "║    FlexOS - Windows Build Assistant      ║" -ForegroundColor Magenta
Write-Host "╚═══════════════════════════════════════════╝" -ForegroundColor Magenta
Write-Host ""
Write-Host "⚠️  FlexOS ne peut pas être buildé directement sur Windows." -ForegroundColor Yellow
Write-Host ""
Write-Host "Options :" -ForegroundColor Cyan
Write-Host "  1. GitHub Actions (recommandé) - push sur GitHub → build auto"
Write-Host "  2. WSL2 (admin requis)"                                    
Write-Host "  3. VM Linux"
Write-Host ""

$choice = Read-Host "Choix (1/2/3)"

switch ($choice) {
    "1" {
        if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
            Write-Host "❌ Installe GitHub CLI: winget install GitHub.cli" -ForegroundColor Red
            exit 1
        }
        if (-not (Test-Path ".git")) { git init; git add -A; git commit -m "FlexOS initial" }
        $remote = git remote get-url origin 2>$null
        if (-not $remote) {
            $repo = Read-Host "Repo GitHub (ex: user/flexos)"
            gh repo create $repo --public --source=. --push
        } else { git push -u origin main }
        Write-Host "✅ Pushé! Va sur GitHub > Actions pour suivre le build." -ForegroundColor Green
    }
    "2" {
        Write-Host @"
📖 WSL2:
  PowerShell admin: wsl --install -d Arch
  Dans WSL: sudo pacman -S archiso
  cd /mnt/d/LINUX/flexos && sudo ./build-iso.sh
"@ -ForegroundColor Cyan
    }
    "3" {
        Write-Host "Copie le dossier sur une VM Arch, puis: sudo ./build-iso.sh" -ForegroundColor Cyan
    }
}
