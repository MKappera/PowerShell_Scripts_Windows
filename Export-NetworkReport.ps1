<#
.SYNOPSIS
  Generates a full network report (adapters, IPs, status) for audit.
#>

Write-Host "=== Generating Network Report ===" -ForegroundColor Cyan
$report = "C:\Logs\NetworkReport_$(Get-Date -Format yyyyMMdd_HHmm).html"

$adapters = Get-NetAdapter | Select Name, Status, MacAddress, LinkSpeed
$ipinfo = Get-NetIPAddress | Select InterfaceAlias, IPAddress, PrefixLength, AddressFamily
$routes = Get-NetRoute | Select DestinationPrefix, NextHop, InterfaceAlias

$html = @"
<h1>Network Report - $env:COMPUTERNAME</h1>
<h2>Adapters:</h2>
<pre>$($adapters | Out-String)</pre>
<h2>IP Configuration:</h2>
<pre>$($ipinfo | Out-String)</pre>
<h2>Routing Table:</h2>
<pre>$($routes | Out-String)</pre>
"@

$html | Out-File $report -Encoding utf8
Write-Host "Report saved to $report" -ForegroundColor Green
