<#
.SYNOPSIS
  Applies registry tweaks for system performance and usability
#>

Write-Host "=== Applying Registry Performance Tweaks ===" -ForegroundColor Cyan

# Disable Windows animations
Set-ItemProperty "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Value ([byte[]](0x90,0x12,0x03,0x80,0x10,0x00,0x00,0x00))

# Faster shutdown
Set-ItemProperty "HKCU:\Control Panel\Desktop" -Name "WaitToKillAppTimeout" -Value "2000"
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "WaitToKillServiceTimeout" -Value "2000"

# Disable tips and suggestions
New-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
 -Name "SoftLandingEnabled" -Value 0 -PropertyType DWord -Force
New-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
 -Name "SubscribedContent-338393Enabled" -Value 0 -PropertyType DWord -Force

Write-Host "Registry tweaks applied successfully." -ForegroundColor Green
