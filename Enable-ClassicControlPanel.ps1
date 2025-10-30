<#
.SYNOPSIS
  Shows classic Control Panel, hides modern Settings
#>

Write-Host "=== Enabling Classic Control Panel ===" -ForegroundColor Cyan

New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
 -Name "NoControlPanel" -Value 0 -PropertyType DWord -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
 -Name "SettingsPageVisibility" -Value "hide:*" -PropertyType String -Force

Write-Host "Classic Control Panel enabled. Settings hidden." -ForegroundColor Green
