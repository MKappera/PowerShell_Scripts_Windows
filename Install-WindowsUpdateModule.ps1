<#
.SYNOPSIS
  Installs and imports the PSWindowsUpdate module.
#>

Write-Host "=== Installing PSWindowsUpdate Module ===" -ForegroundColor Cyan

# Ensure TLS 1.2 for secure download
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Install NuGet provider if missing
if (-not (Get-PackageProvider -Name NuGet -ErrorAction SilentlyContinue)) {
    Install-PackageProvider -Name NuGet -Force
}

# Install and import PSWindowsUpdate
Install-Module -Name PSWindowsUpdate -Force -AllowClobber
Import-Module PSWindowsUpdate

Write-Host "PSWindowsUpdate installed and imported successfully!" -ForegroundColor Green
