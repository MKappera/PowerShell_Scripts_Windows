<#
.SYNOPSIS
  Restarts server safely after checking for logged-in users and updates.
#>

Write-Host "=== Safe Server Restart ===" -ForegroundColor Cyan

# Check for active users
$users = quser 2>$null
if ($users) {
    Write-Host "Active user sessions found:" -ForegroundColor Yellow
    $users
} else {
    Write-Host "No active users found." -ForegroundColor Green
}

# Check for pending updates
$pending = (New-Object -ComObject Microsoft.Update.Session).CreateUpdateInstaller().IsBusy
if ($pending) {
    Write-Host "Pending updates detected. Restart may be required after installation." -ForegroundColor Yellow
}

# Confirm before reboot
$confirm = Read-Host "Do you want to reboot the server now? (Y/N)"
if ($confirm -eq "Y") {
    Restart-Computer -Force
} else {
    Write-Host "Reboot aborted by user." -ForegroundColor Red
}
