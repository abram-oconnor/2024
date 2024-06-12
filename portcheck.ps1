# Prompt the user for the IP address
$ipAddress = Read-Host -Prompt "Enter the IP address to check"

# Ping the IP address
$pingResult = Test-Connection -ComputerName $ipAddress -Count 1 -Quiet

if ($pingResult) {
    Write-Output "The IP address ${ipAddress} is reachable."
    
    # Prompt the user for the port number
    $port = Read-Host -Prompt "Enter the port number to check"

    # Check if the port is open
    $portResult = Test-NetConnection -ComputerName $ipAddress -Port $port -InformationLevel Quiet

    # Display the result
    if ($portResult) {
        Write-Output "Port ${port} is open on ${ipAddress}."
    } else {
        Write-Output "Port ${port} is closed on ${ipAddress}."
    }
} else {
    Write-Output "The IP address ${ipAddress} is not reachable."
}
