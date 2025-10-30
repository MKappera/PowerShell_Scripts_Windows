<#
.SYNOPSIS
  Forces Task Manager to open in full view
#>

Write-Host "=== Configuring Task Manager View ===" -ForegroundColor Cyan
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Force | Out-Null
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -Value ([byte[]](0x01,0x00,0x00,0x00))
Write-Host "Task Manager will now open in detailed mode." -ForegroundColor Green
