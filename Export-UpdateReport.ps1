<#
.SYNOPSIS
  Generates an HTML report of installed and pending updates.
#>

Write-Host "=== Generating Windows Update Report ===" -ForegroundColor Cyan

$report = "C:\Logs\WindowsUpdate_Report_$(Get-Date -Format yyyyMMdd_HHmm).html"
$installed = Get-WmiObject -Class "Win32_QuickFixEngineering" | Select HotFixID, Description, InstalledOn
$pending = Get-WindowsUpdate -MicrosoftUpdate -AcceptAll -IgnoreReboot | Select KB, Title

$html = @"
<h1>Windows Update Report - $env:COMPUTERNAME</h1>
<h2>Installed Updates</h2>
<pre>$($installed | Out-String)</pre>
<h2>Pending Updates</h2>
<pre>$($pending | Out-String)</pre>
"@

$html | Out-File $report -Encoding utf8
Write-Host "Report saved to: $report" -ForegroundColor Green
