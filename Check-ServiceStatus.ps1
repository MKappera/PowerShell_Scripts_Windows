<#
.SYNOPSIS
  Detects automatic services that failed to start.
#>

Write-Host "=== Checking Non-Running Auto Services ===" -ForegroundColor Cyan
Get-Service | Where-Object { $_.StartType -eq "Automatic" -and $_.Status -ne "Running" } | 
Select DisplayName, Status, StartType | Format-Table -AutoSize
