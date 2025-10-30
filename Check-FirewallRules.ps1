<#
.SYNOPSIS
  Audits and exports all firewall rules.
#>

Write-Host "=== Checking Firewall Rules ===" -ForegroundColor Cyan

$exportPath = "C:\Logs\FirewallRules_$(Get-Date -Format yyyyMMdd_HHmm).csv"
Get-NetFirewallRule | Select DisplayName, Enabled, Direction, Action, Profile | Export-Csv -NoTypeInformation -Path $exportPath

Write-Host "Firewall rule report saved at: $exportPath" -ForegroundColor Green
