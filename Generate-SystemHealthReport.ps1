<#
.SYNOPSIS
  Generates a system health report in HTML format.
#>

Write-Host "=== Generating System Health Report ===" -ForegroundColor Cyan

$reportPath = "C:\Logs\SystemHealthReport_$(Get-Date -Format yyyyMMdd_HHmm).html"

$os = Get-CimInstance Win32_OperatingSystem
$cpu = Get-Counter '\Processor(_Total)\% Processor Time'
$mem = Get-Counter '\Memory\Available MBytes'
$disks = Get-PSDrive -PSProvider FileSystem
$services = Get-Service | Where-Object {$_.Status -ne 'Running' -and $_.StartType -eq 'Automatic'}
$events = Get-WinEvent -FilterHashtable @{LogName='System'; Level=2; StartTime=(Get-Date).AddDays(-1)}

$html = @"
<h1>System Health Report - $env:COMPUTERNAME</h1>
<h2>OS: $($os.Caption)</h2>
<h3>CPU Usage: $([math]::Round($cpu.CounterSamples.CookedValue,2))%</h3>
<h3>Free Memory: $([math]::Round($mem.CounterSamples.CookedValue/1024,2)) GB</h3>
<h3>Drives:</h3>
<pre>$($disks | Select Name, @{N='Free(GB)';E={[math]::Round($_.Free/1GB,2)}} | Out-String)</pre>
<h3>Non-running Services:</h3>
<pre>$($services | Select DisplayName, Status | Out-String)</pre>
<h3>Critical Errors (Last 24h):</h3>
<pre>$($events | Select TimeCreated, Id, Message | Out-String)</pre>
"@

$html | Out-File $reportPath -Encoding utf8
Write-Host "Report generated at: $reportPath" -ForegroundColor Green
