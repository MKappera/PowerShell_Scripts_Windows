<#
.SYNOPSIS
  Monitors CPU, Memory, and Disk usage on Windows Server 2016+.
.DESCRIPTION
  Logs system resource usage every 10 seconds. Ideal for performance tracking or alert setup.
#>

Write-Host "=== System Resource Monitoring Started ===" -ForegroundColor Cyan

$logDir = "C:\Logs"
if (!(Test-Path $logDir)) { New-Item -ItemType Directory -Path $logDir | Out-Null }
$logFile = "$logDir\SystemResourceLog_$(Get-Date -Format yyyyMMdd_HHmm).csv"

# CSV Header
"Timestamp,CPU(%),Memory_Used(GB),FreeMemory(GB),Disk_Reads/sec,Disk_Writes/sec" | Out-File $logFile -Encoding utf8

# Collect metrics for 15 minutes (every 10 seconds)
for ($i = 1; $i -le 90; $i++) {
    $cpu = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
    $freeMem = (Get-Counter '\Memory\Available MBytes').CounterSamples.CookedValue / 1024
    $totalMem = (Get-CimInstance Win32_OperatingSystem).TotalVisibleMemorySize / 1MB
    $usedMem = $totalMem - $freeMem
    $diskRead = (Get-Counter '\PhysicalDisk(_Total)\Disk Reads/sec').CounterSamples.CookedValue
    $diskWrite = (Get-Counter '\PhysicalDisk(_Total)\Disk Writes/sec').CounterSamples.CookedValue

    "$((Get-Date -Format 'yyyy-MM-dd HH:mm:ss')),$([math]::Round($cpu,2)),$([math]::Round($usedMem,2)),$([math]::Round($freeMem,2)),$([math]::Round($diskRead,2)),$([math]::Round($diskWrite,2))" | Out-File $logFile -Append
    Start-Sleep -Seconds 10
}

Write-Host "Monitoring complete. Log saved to: $logFile" -ForegroundColor Green
