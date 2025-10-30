<#
.SYNOPSIS
  Cleans disk space and removes temporary/unnecessary files.
#>

Write-Host "=== Disk Cleanup Started ===" -ForegroundColor Cyan
$logPath = "C:\Logs"
if (!(Test-Path $logPath)) { New-Item -Path $logPath -ItemType Directory | Out-Null }
$logFile = "$logPath\Clean-Disk_$(Get-Date -Format yyyyMMdd_HHmm).log"
Start-Transcript -Path $logFile

# Clean temp folders
$folders = @("$env:TEMP", "C:\Windows\Temp", "C:\Windows\Prefetch")
foreach ($folder in $folders) {
    if (Test-Path $folder) {
        Write-Host "Cleaning $folder ..."
        Get-ChildItem -Path $folder -Recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force
    }
}

# Clear Windows Update cache
$WUPath = "C:\Windows\SoftwareDistribution\Download"
if (Test-Path $WUPath) {
    Write-Host "Cleaning Windows Update cache..."
    Stop-Service -Name wuauserv -Force -ErrorAction SilentlyContinue
    Remove-Item "$WUPath\*" -Recurse -Force -ErrorAction SilentlyContinue
    Start-Service -Name wuauserv -ErrorAction SilentlyContinue
}

# Clean event logs (except Security)
Write-Host "Clearing Event Logs (except Security)..."
Get-EventLog -List | Where-Object {$_.Log -ne 'Security'} | ForEach-Object { Clear-EventLog -LogName $_.Log }

# Empty Recycle Bin
Write-Host "Emptying Recycle Bin..."
Clear-RecycleBin -Force -ErrorAction SilentlyContinue

# Display current disk space
Write-Host "`nCurrent Disk Space Status:"
Get-PSDrive -PSProvider FileSystem | 
Select Name, @{N='Free(GB)';E={[math]::Round($_.Free/1GB,2)}}, @{N='Used(GB)';E={[math]::Round($_.Used/1GB,2)}} | 
Format-Table -AutoSize

Stop-Transcript
Write-Host "=== Disk Cleanup Completed ===`nLog: $logFile" -ForegroundColor Green
