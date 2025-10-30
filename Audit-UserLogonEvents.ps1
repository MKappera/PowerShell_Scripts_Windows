<#
.SYNOPSIS
  Displays recent logon events (Success & Failure).
#>

Write-Host "=== User Logon Audit ===" -ForegroundColor Cyan

Get-WinEvent -FilterHashtable @{LogName='Security';ID=4624,4625} -MaxEvents 50 |
Select-Object TimeCreated, Id, @{n='Account';e={$_.Properties[5].Value}}, @{n='Workstation';e={$_.Properties[11].Value}} |
Format-Table -AutoSize
