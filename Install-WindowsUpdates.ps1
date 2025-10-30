<#
.SYNOPSIS
  Downloads and installs all available updates.
#>

Write-Host "=== Installing Windows Updates ===" -ForegroundColor Cyan
Import-Module PSWindowsUpdate -ErrorAction SilentlyContinue

# Log file
$logFile = "C:\Logs\WindowsUpdate_Install_$(Get-Date -Format yyyyMMdd_HHmm).log"

# Download and install updates
Get-WindowsUpdate -MicrosoftUpdate -AcceptAll -Install -IgnoreReboot -Verbose | Out-File $logFile -Encoding utf8

Write-Host "Updates installation complete! Log saved at: $logFile" -ForegroundColor Green
