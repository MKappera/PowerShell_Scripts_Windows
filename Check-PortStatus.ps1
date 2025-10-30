<#
.SYNOPSIS
  Checks if a port is open on a remote server.
#>

$hostName = Read-Host "Enter hostname or IP"
$port = Read-Host "Enter port number"

$result = Test-NetConnection -ComputerName $hostName -Port $port
if ($result.TcpTestSucceeded) {
    Write-Host "Port $port open on $hostName" -ForegroundColor Green
} else {
    Write-Host "Port $port closed or filtered on $hostName" -ForegroundColor Red
}
