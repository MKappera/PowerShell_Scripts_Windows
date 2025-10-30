<#
.SYNOPSIS
  Clears Windows Update cache safely.
#>

Write-Host "=== Clearing Windows Update Cache ===" -ForegroundColor Cyan

Stop-Service wuauserv -Force
Stop-Service bits -Force
Remove-Item "C:\Windows\SoftwareDistribution" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "C:\Windows\System32\catroot2" -Recurse -Force -ErrorAction SilentlyContinue
Start-Service wuauserv
Start-Service bits

Write-Host "Windows Update cache cleared successfully!" -ForegroundColor Green
