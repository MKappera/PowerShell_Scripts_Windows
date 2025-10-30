<#
.SYNOPSIS
  Checks for pending Windows updates.
#>

Write-Host "=== Checking Windows Updates ===" -ForegroundColor Cyan
Install-Module PSWindowsUpdate -Force -ErrorAction SilentlyContinue
Get-WindowsUpdate | Select KB, Title, Size, IsDownloaded, IsInstalled | Format-Table -AutoSize
