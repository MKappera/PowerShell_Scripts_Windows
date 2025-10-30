<#
.SYNOPSIS
  Scans and installs Windows Updates on Windows Server.
#>

Write-Host "=== Checking for Windows Updates ===" -ForegroundColor Cyan

# Requires PSWindowsUpdate module
if (!(Get-Module -ListAvailable -Name PSWindowsUpdate)) {
    Write-Host "Installing PSWindowsUpdate module..." -ForegroundColor Yellow
    Install-PackageProvider -Name NuGet -Force
    Install-Module PSWindowsUpdate -Force -Confirm:$false
}

Import-Module PSWindowsUpdate

Write-Host "Fetching available updates..."
Get-WindowsUpdate | Out-GridView -Title "Available Updates"

# To install automatically, uncomment below:
# Get-WindowsUpdate -Install -AcceptAll -AutoReboot
