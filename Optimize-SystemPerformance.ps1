<#
.SYNOPSIS
  Optimizes Windows Server performance (2016 and above)
.DESCRIPTION
  Stops non-critical services, clears temp data, optimizes volumes,
  and performs general system tuning for better responsiveness.
#>

Write-Host "=== Starting System Performance Optimization ===" -ForegroundColor Cyan
$logPath = "C:\Logs"
if (!(Test-Path $logPath)) { New-Item -Path $logPath -ItemType Directory | Out-Null }
$logFile = "$logPath\Optimize-SystemPerformance_$(Get-Date -Format yyyyMMdd_HHmm).log"
Start-Transcript -Path $logFile

# Stop optional background services (safe for servers)
$services = @(
    "DiagTrack",        # Telemetry
    "SysMain",          # Prefetch/Superfetch
    "WSearch"           # Windows Search (optional for servers)
)

foreach ($svc in $services) {
    if (Get-Service -Name $svc -ErrorAction SilentlyContinue) {
        Write-Host "Stopping and disabling: $svc"
        Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
        Set-Service -Name $svc -StartupType Disabled
    }
}

# Clear temporary files
$tempPaths = @("$env:TEMP", "C:\Windows\Temp")
foreach ($path in $tempPaths) {
    Write-Host "Cleaning temporary files in $path"
    Get-ChildItem -Path $path -Recurse -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse
}

# Optimize drives (Defragment HDDs / Retrim SSDs)
Write-Host "Optimizing local drives..."
Get-Volume | Where-Object DriveType -eq 'Fixed' | ForEach-Object {
    Optimize-Volume -DriveLetter $_.DriveLetter -Verbose
}

# Clear DNS cache
Write-Host "Flushing DNS cache..."
ipconfig /flushdns | Out-Null

Stop-Transcript
Write-Host "=== System Optimization Complete ===`nLog: $logFile" -ForegroundColor Green
