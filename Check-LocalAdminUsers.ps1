<#
.SYNOPSIS
  Lists local administrator group members.
#>

Write-Host "=== Local Administrator Accounts ===" -ForegroundColor Cyan
Get-LocalGroupMember -Group "Administrators" | Select Name, PrincipalSource
