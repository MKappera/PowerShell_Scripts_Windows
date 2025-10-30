<#
.SYNOPSIS
  Checks if system reboot is pending.
#>

Write-Host "=== Checking Pending Reboot Status ===" -ForegroundColor Cyan

$rebootPending = $false
if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending") { $rebootPending = $true }
if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired") { $rebootPending = $true }

if ($rebootPending) {
    Write-Host "System reboot is pending." -ForegroundColor Yellow
} else {
    Write-Host "No reboot required." -ForegroundColor Green
}
