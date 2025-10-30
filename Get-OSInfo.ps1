<#
.SYNOPSIS
  Displays key OS and hardware details for audit or documentation.
#>

Write-Host "=== System OS Information ===" -ForegroundColor Cyan

$os = Get-CimInstance Win32_OperatingSystem
$cs = Get-CimInstance Win32_ComputerSystem

$info = [PSCustomObject]@{
    'Hostname'        = $env:COMPUTERNAME
    'OS Name'         = $os.Caption
    'OS Version'      = $os.Version
    'OS Build'        = $os.BuildNumber
    'Install Date'    = $os.InstallDate
    'Last Boot'       = $os.LastBootUpTime
    'System Uptime'   = ((Get-Date) - $os.LastBootUpTime).ToString("dd\.hh\:mm")
    'Manufacturer'    = $cs.Manufacturer
    'Model'           = $cs.Model
    'Total RAM (GB)'  = [math]::Round($cs.TotalPhysicalMemory / 1GB, 2)
    'Processor'       = (Get-CimInstance Win32_Processor).Name
}

$info | Format-Table -AutoSize
