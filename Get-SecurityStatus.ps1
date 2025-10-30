<#
.SYNOPSIS
  Checks basic security status of Windows Server.
#>

Write-Host "=== Security Status Report ===" -ForegroundColor Cyan

$report = [ordered]@{
    ComputerName = $env:COMPUTERNAME
    UAC_Enabled = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System").EnableLUA
    Firewall_Enabled = (Get-NetFirewallProfile | Where-Object Enabled -eq 'True').Count -gt 0
    Defender_Status = (Get-Service -Name WinDefend -ErrorAction SilentlyContinue).Status
    RDP_Enabled = (Get-ItemProperty "HKLM:\System\CurrentControlSet\Control\Terminal Server").fDenyTSConnections -eq 0
    AutoUpdate = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -ErrorAction SilentlyContinue).NoAutoUpdate
}

$report | Format-Table -AutoSize
