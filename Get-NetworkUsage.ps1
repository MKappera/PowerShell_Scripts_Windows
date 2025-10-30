<#
.SYNOPSIS
  Displays live network bandwidth usage.
#>

Write-Host "=== Monitoring Network Usage (Press Ctrl+C to stop) ===" -ForegroundColor Cyan
$adapter = (Get-NetAdapter | Where-Object Status -eq "Up" | Select -First 1).Name

while ($true) {
    $stats = Get-NetAdapterStatistics -Name $adapter
    $rx = [math]::Round($stats.ReceivedBytes / 1MB, 2)
    $tx = [math]::Round($stats.SentBytes / 1MB, 2)
    Write-Host ("[$adapter] RX: $rx MB | TX: $tx MB")
    Start-Sleep -Seconds 5
}
