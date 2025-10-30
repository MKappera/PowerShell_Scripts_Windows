<#
.SYNOPSIS
  Enhances PowerShell shell experience
#>

Write-Host "=== Enhancing PowerShell Shell ===" -ForegroundColor Cyan

# Create profile if not exist
if (-not (Test-Path $PROFILE)) { New-Item -ItemType File -Path $PROFILE -Force }

@"
# Custom PowerShell Profile
Set-Alias ll Get-ChildItem
Set-Alias grep Select-String
function Prompt {
    Write-Host ("PS " + (Get-Location) + ">") -ForegroundColor Green -NoNewline
    return " "
}
"@ | Out-File $PROFILE -Encoding utf8

Write-Host "Custom aliases and prompt applied. Restart PowerShell to see changes." -ForegroundColor Green
