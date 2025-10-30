<#
.SYNOPSIS
  Performs full Windows Defender scan.
#>

Write-Host "=== Running Windows Defender Scan ===" -ForegroundColor Cyan

Start-MpScan -ScanType FullScan
Write-Host "Full scan initiated. Check results using Get-MpThreat." -ForegroundColor Green
