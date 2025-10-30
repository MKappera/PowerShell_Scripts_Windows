<#
.SYNOPSIS
  Generates a full HTML security report.
#>

Write-Host "=== Generating Security Report ===" -ForegroundColor Cyan

$reportPath = "C:\Logs\SecurityReport_$(Get-Date -Format yyyyMMdd_HHmm).html"

$firewall = Get-NetFirewallProfile | Select Name, Enabled
$admins = Get-LocalGroupMember -Group "Administrators" | Select Name
$rdp = (Get-ItemProperty "HKLM:\System\CurrentControlSet\Control\Terminal Server").fDenyTSConnections -eq 0
$defender = (Get-Service WinDefend).Status

$html = @"
<h1>Security Report - $env:COMPUTERNAME</h1>
<h2>Firewall Status</h2>
<pre>$($firewall | Out-String)</pre>
<h2>Administrators</h2>
<pre>$($admins | Out-String)</pre>
<h2>RDP Enabled</h2>
<p>$rdp</p>
<h2>Windows Defender</h2>
<p>$defender</p>
"@

$html | Out-File $reportPath -Encoding utf8
Write-Host "Security report saved to: $reportPath" -ForegroundColor Green
