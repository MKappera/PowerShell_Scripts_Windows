<#
.SYNOPSIS
  Displays all network adapter configuration details.
#>

Write-Host "=== Network Configuration Info ===" -ForegroundColor Cyan

Get-NetAdapter | ForEach-Object {
    $adapter = $_.Name
    Write-Host "`n--- Adapter: $adapter ---" -ForegroundColor Yellow
    Get-NetIPAddress -InterfaceAlias $adapter | Select IPAddress, PrefixLength, AddressFamily
    Get-DnsClientServerAddress -InterfaceAlias $adapter | Select ServerAddresses
    Get-NetIPConfiguration -InterfaceAlias $adapter | 
    Select-Object InterfaceAlias, IPv4Address, IPv6Address, DNSServer, DefaultGateway | Format-List
}
