<#
.SYNOPSIS
  Applies dark mode, neon accent, and wallpaper
#>

Write-Host "=== Applying UI Personalization ===" -ForegroundColor Cyan

# Dark mode for system and apps
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" `
 -Name "SystemUsesLightTheme" -Value 0 -Type DWord
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" `
 -Name "AppsUseLightTheme" -Value 0 -Type DWord

# Accent color (neon green)
New-ItemProperty "HKCU:\Software\Microsoft\Windows\DWM" -Name "AccentColor" -Value 0x00FF00 -PropertyType DWord -Force

# Wallpaper
$wallpaper = "C:\Wallpapers\fitio_dark_neon.jpg"
if (Test-Path $wallpaper) {
    Set-ItemProperty "HKCU:\Control Panel\Desktop" -Name "Wallpaper" -Value $wallpaper
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
    Write-Host "Wallpaper applied." -ForegroundColor Green
}

Write-Host "Dark mode and accent applied successfully." -ForegroundColor Green
