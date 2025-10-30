<#
.SYNOPSIS
  Resets network adapter, clears DNS, and renews IP.
#>

Write-Host "=== Network Adapter Reset ===" -ForegroundColor Cyan

$adapter = Get-NetAdapter | Where-Object Status -eq "Up" | Select-Object -First 1

if ($adapter) {
    Disable-NetAdapter -Name $adapter.Name -Confirm:$false
    Start-Sleep -Seconds 5
    Enable-NetAdapter -Name $adapter.Name
    ipconfig /flushdns | Out-Null
    ipconfig /renew | Out-Null
    Write-Host "Adapter $($adapter.Name) reset successfully." -ForegroundColor Green
} else {
    Write-Host "No active adapter found." -ForegroundColor Red
}
