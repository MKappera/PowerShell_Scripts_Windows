<#
.SYNOPSIS
  Lists installed system drivers for audit or troubleshooting.
#>

Write-Host "=== Installed Drivers ===" -ForegroundColor Cyan
Get-WmiObject Win32_PnPSignedDriver | 
Select DeviceName, DriverVersion, DriverProviderName, DriverDate | 
Sort DriverDate -Descending | Format-Table -AutoSize
