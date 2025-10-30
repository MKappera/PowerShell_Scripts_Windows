<#
.SYNOPSIS
  Schedules automatic weekly Windows Update installation.
#>

Write-Host "=== Creating Weekly Windows Update Task ===" -ForegroundColor Cyan

$taskName = "AutoWindowsUpdate"
$taskScript = "C:\Scripts\Updates\Install-WindowsUpdates.ps1"

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -File `"$taskScript`""
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At 03:00AM
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description "Weekly Windows Updates" -RunLevel Highest -User "SYSTEM"

Write-Host "Scheduled task '$taskName' created successfully!" -ForegroundColor Green
