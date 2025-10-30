<#
.SYNOPSIS
  Lists all installed Windows updates (KBs) with install dates.
#>

Write-Host "=== Installed Windows Updates ===" -ForegroundColor Cyan
Get-HotFix | Sort-Object InstalledOn -Descending | Select HotFixID, Description, InstalledOn | Format-Table -AutoSize
