<#
.SYNOPSIS
  Checks Windows file and component store integrity.
#>

Write-Host "=== Running System Integrity Checks ===" -ForegroundColor Cyan

sfc /scannow
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth

Write-Host "System integrity verification complete!" -ForegroundColor Green
