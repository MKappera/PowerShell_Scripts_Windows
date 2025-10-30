<#
.SYNOPSIS
  Retrieves critical errors and warnings from Event Logs in last 24 hours.
#>

Write-Host "=== System Event Health Check (Last 24 Hours) ===" -ForegroundColor Cyan

$since = (Get-Date).AddDays(-1)
$events = Get-WinEvent -FilterHashtable @{LogName='System'; Level=2; StartTime=$since} -ErrorAction SilentlyContinue
$warnings = Get-WinEvent -FilterHashtable @{LogName='System'; Level=3; StartTime=$since} -ErrorAction SilentlyContinue

Write-Host "`n--- Critical Errors ---" -ForegroundColor Red
$events | Select TimeCreated, Id, Message | Format-Table -AutoSize

Write-Host "`n--- Warnings ---" -ForegroundColor Yellow
$warnings | Select TimeCreated, Id, Message | Format-Table -AutoSize
