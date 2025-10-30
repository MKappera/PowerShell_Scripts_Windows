<#
.SYNOPSIS
  Manages Windows Firewall rules.
#>

Write-Host "=== Windows Firewall Rules ===" -ForegroundColor Cyan

# Export all firewall rules
$exportPath = "C:\Logs\FirewallRules_$(Get-Date -Format yyyyMMdd_HHmm).csv"
Get-NetFirewallRule | Select DisplayName, Direction, Action, Enabled, Profile | Export-Csv $exportPath -NoTypeInformation
Write-Host "Exported Firewall rules to: $exportPath"

# Disable any specific rule (example)
# Disable-NetFirewallRule -DisplayName "Remote Desktop"
