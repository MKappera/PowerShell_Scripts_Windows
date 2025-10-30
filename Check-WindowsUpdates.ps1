<#
.SYNOPSIS
  Scans and displays available Windows Updates.
#>

Write-Host "=== Checking for Available Windows Updates ===" -ForegroundColor Cyan
Import-Module PSWindowsUpdate -ErrorAction SilentlyContinue

$updates = Get-WindowsUpdate -MicrosoftUpdate -AcceptAll -IgnoreReboot
if ($updates) {
    $updates | Select KB, Title, Size, IsDownloaded, IsInstalled | Format-Table -AutoSize
} else {
    Write-Host "No new updates available." -ForegroundColor Green
}
