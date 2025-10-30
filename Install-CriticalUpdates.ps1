<#
.SYNOPSIS
  Installs only critical and security updates.
#>

Write-Host "=== Installing Critical and Security Updates ===" -ForegroundColor Cyan
Import-Module PSWindowsUpdate -ErrorAction SilentlyContinue

Get-WindowsUpdate -MicrosoftUpdate -AcceptAll -Install -Category "SecurityUpdates","CriticalUpdates" -Verbose
Write-Host "Critical updates installation completed." -ForegroundColor Green
