<#
.SYNOPSIS
  Displays installed Windows updates.
#>

Write-Host "=== Installed Updates ===" -ForegroundColor Cyan

Get-WmiObject -Class Win32_QuickFixEngineering | 
Select HotFixID, Description, InstalledOn | 
Sort-Object InstalledOn -Descending | 
Format-Table -AutoSize
