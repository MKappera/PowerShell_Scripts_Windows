<#
.SYNOPSIS
  Configures static IP, gateway, and DNS settings.
#>

Write-Host "=== Configure Static IP ===" -ForegroundColor Cyan

$InterfaceAlias = Read-Host "Enter Network Interface Name (e.g., Ethernet0)"
$IPAddress = Read-Host "Enter Static IP (e.g., 192.168.1.10)"
$Prefix = Read-Host "Enter Prefix Length (e.g., 24)"
$Gateway = Read-Host "Enter Default Gateway (e.g., 192.168.1.1)"
$DNS = Read-Host "Enter DNS Servers (comma-separated, e.g., 8.8.8.8,8.8.4.4)"

# Remove DHCP and set static
Set-NetIPInterface -InterfaceAlias $InterfaceAlias -Dhcp Disabled
New-NetIPAddress -InterfaceAlias $InterfaceAlias -IPAddress $IPAddress -PrefixLength $Prefix -DefaultGateway $Gateway -ErrorAction SilentlyContinue

# Set DNS
Set-DnsClientServerAddress -InterfaceAlias $InterfaceAlias -ServerAddresses ($DNS -split ",")

Write-Host "Static IP configuration applied successfully!" -ForegroundColor Green
