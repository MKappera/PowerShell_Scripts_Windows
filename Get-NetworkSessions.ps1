<#
.SYNOPSIS
  Lists all active TCP/UDP sessions.
#>

Write-Host "=== Active Network Sessions ===" -ForegroundColor Cyan
Get-NetTCPConnection | Select LocalAddress, LocalPort, RemoteAddress, RemotePort, State | Sort-Object State | Format-Table -AutoSize
