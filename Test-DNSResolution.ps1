<#
.SYNOPSIS
  Tests DNS resolution and measures response latency.
#>

Write-Host "=== DNS Resolution Test ===" -ForegroundColor Cyan

$domains = @("google.com", "microsoft.com", "github.com")
foreach ($domain in $domains) {
    $start = Get-Date
    try {
        $ip = (Resolve-DnsName $domain -ErrorAction Stop).IPAddress
        $time = (Get-Date) - $start
        Write-Host "$domain resolved to $ip in $($time.TotalMilliseconds) ms" -ForegroundColor Green
    } catch {
        Write-Host "Failed to resolve $domain" -ForegroundColor Red
    }
}
