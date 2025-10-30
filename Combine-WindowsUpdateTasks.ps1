<#
.SYNOPSIS
  Combines all update management steps in sequence.
#>

Write-Host "=== Running Full Windows Update Maintenance ===" -ForegroundColor Cyan

& "C:\Scripts\Updates\Install-WindowsUpdateModule.ps1"
& "C:\Scripts\Updates\Check-WindowsUpdates.ps1"
& "C:\Scripts\Updates\Install-WindowsUpdates.ps1"
& "C:\Scripts\Updates\Export-UpdateReport.ps1"
& "C:\Scripts\Updates\Check-RebootPending.ps1"

Write-Host "Full update maintenance completed successfully!" -ForegroundColor Green
