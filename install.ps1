# Figure it Out - One-Line Installer for Windows PowerShell
# Usage: irm https://raw.githubusercontent.com/eugineous/figure-it-out/main/install.ps1 | iex

$ErrorActionPreference = "Stop"

$SkillName = "figure-it-out.md"
$SkillsDir = "$env:USERPROFILE\.claude\skills"
$RepoUrl = "https://raw.githubusercontent.com/eugineous/figure-it-out/main/figure-it-out.md"

Write-Host ""
Write-Host "  ==================================================" -ForegroundColor Cyan
Write-Host "  |           FIGURE IT OUT - INSTALLER            |" -ForegroundColor Cyan
Write-Host "  |  The Ultimate Problem-Solving Skill for Claude |" -ForegroundColor Cyan
Write-Host "  ==================================================" -ForegroundColor Cyan
Write-Host ""

# Create skills directory if it doesn't exist
if (-not (Test-Path $SkillsDir)) {
    Write-Host "  Creating skills directory: $SkillsDir" -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $SkillsDir -Force | Out-Null
}

# Download the skill
Write-Host "  Downloading Figure it Out skill..." -ForegroundColor Yellow
try {
    Invoke-WebRequest -Uri $RepoUrl -OutFile "$SkillsDir\$SkillName" -UseBasicParsing
} catch {
    Write-Host "  ERROR: Download failed. $_" -ForegroundColor Red
    Write-Host "  Please try manual install: download figure-it-out.md to $SkillsDir\" -ForegroundColor Red
    exit 1
}

# Verify installation
if (Test-Path "$SkillsDir\$SkillName") {
    $Lines = (Get-Content "$SkillsDir\$SkillName").Count
    Write-Host ""
    Write-Host "  SUCCESS! Figure it Out installed ($Lines lines of pure force)" -ForegroundColor Green
    Write-Host ""
    Write-Host "  Location: $SkillsDir\$SkillName" -ForegroundColor White
    Write-Host ""
    Write-Host "  Next: Restart Claude Code and say 'figure it out'" -ForegroundColor White
    Write-Host ""
    Write-Host "  ==================================================" -ForegroundColor Cyan
    Write-Host "  |  Stop hitting walls. Start saying 'figure it out' |" -ForegroundColor Cyan
    Write-Host "  ==================================================" -ForegroundColor Cyan
    Write-Host ""
} else {
    Write-Host "  ERROR: Installation failed. Please try manual install." -ForegroundColor Red
    exit 1
}
