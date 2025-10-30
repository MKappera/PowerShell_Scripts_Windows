<#
.SYNOPSIS
  Enables key Windows audit categories.
#>

Write-Host "=== Enabling Security Audit Policies ===" -ForegroundColor Cyan

$auditCategories = @(
    "Account Logon", "Logon/Logoff", "Object Access", 
    "Privilege Use", "Policy Change", "Account Management", 
    "DS Access", "System"
)

foreach ($category in $auditCategories) {
    auditpol /set /category:"$category" /success:enable /failure:enable
    Write-Host "Enabled auditing for: $category"
}

Write-Host "Audit policies configured successfully!" -ForegroundColor Green
