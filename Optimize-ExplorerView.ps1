<#
.SYNOPSIS
  Optimizes File Explorer view
#>

Write-Host "=== Optimizing File Explorer Settings ===" -ForegroundColor Cyan

Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
 -Name "LaunchTo" -Value 1
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
 -Name "HideFileExt" -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" `
 -Name "ShowRecent" -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" `
 -Name "ShowFrequent" -Value 0

Write-Host "File Explorer now opens to 'This PC' and shows extensions." -ForegroundColor Green
