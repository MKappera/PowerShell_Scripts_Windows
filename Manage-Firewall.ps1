<#
.SYNOPSIS
  Lists, enables/disables, and exports firewall rules.
#>

Write-Host "=== Managing Windows Firewall Rules ===" -ForegroundColor Cyan

# Export current rules
$path = "C:\Logs\FirewallRules_$(Get-Date -Format yyyyMMdd_HHmm).csv"
Get-NetFirewallRule | Select DisplayName, Enabled, Direction, Action, Profile | Export-Csv -NoTypeInformation -Path $path
Write-Host "Exported firewall rules to: $path"

# Example: Enable Remote Desktop
# Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# Example: Disable File and Printer Sharing
# Disable-NetFirewallRule -DisplayGroup "File and Printer Sharing"
