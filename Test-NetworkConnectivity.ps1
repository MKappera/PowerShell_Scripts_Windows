<#
.SYNOPSIS
  Tests ICMP, port connectivity, and DNS resolution for key servers.
#>

Write-Host "=== Network Connectivity Test ===" -ForegroundColor Cyan

$targets = @("8.8.8.8", "1.1.1.1", "google.com", "yourdomaincontroller.domain.local")

foreach ($target in $targets) {
    Write-Host "`nTesting $target..." -ForegroundColor Yellow
    if (Test-Connection -ComputerName $target -Count 2 -Quiet) {
        Write-Host "Ping Success" -ForegroundColor Green
    } else {
        Write-Host "Ping Failed" -ForegroundColor Red
    }

    try {
        Test-NetConnection -ComputerName $target -Port 443 | Select-Object ComputerName, TcpTestSucceeded
    } catch {
        Write-Host "Port Test Failed" -ForegroundColor Red
    }
}
