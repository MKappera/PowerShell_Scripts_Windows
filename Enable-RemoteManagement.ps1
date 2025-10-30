<#
.SYNOPSIS
  Enables PowerShell Remoting and configures WinRM service.
#>

Write-Host "=== Enabling Remote Management ===" -ForegroundColor Cyan

Enable-PSRemoting -Force
Set-Service WinRM -StartMode Automatic
Start-Service WinRM

# Enable firewall rules
Enable-NetFirewallRule -DisplayGroup "Windows Remote Management"

Write-Host "Remote Management enabled successfully!" -ForegroundColor Green
