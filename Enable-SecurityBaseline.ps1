<#
.SYNOPSIS
  Applies baseline security settings for Windows Server 2016 and above.
#>

Write-Host "=== Applying Security Baseline ===" -ForegroundColor Cyan

# Disable SMBv1
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -NoRestart -ErrorAction SilentlyContinue

# Enable UAC
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name EnableLUA -Value 1

# Enable Secure RDP
Set-ItemProperty "HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -Name SecurityLayer -Value 2
Set-ItemProperty "HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -Name UserAuthentication -Value 1

# Configure Audit Policies
Write-Host "Configuring Audit Policies..."
auditpol /set /subcategory:"Logon" /success:enable /failure:enable
auditpol /set /subcategory:"Account Logon" /success:enable /failure:enable
auditpol /set /subcategory:"Privilege Use" /success:disable /failure:enable

# Enable Windows Defender if disabled
Set-Service -Name WinDefend -StartupType Automatic
Start-Service WinDefend

# Enable Firewall on all profiles
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

Write-Host "Security baseline applied successfully!" -ForegroundColor Green
