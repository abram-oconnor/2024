# Prompt the user for the IP address
$ipAddress = Read-Host -Prompt "Enter the IP address to check"

# Prompt the user for the port number
$port = Read-Host -Prompt "Enter the port number to check"

# Check if the port is open
$result = Test-NetConnection -ComputerName $ipAddress -Port $port -InformationLevel Quiet

# Display the result
if ($result) {
    Write-Output "Port ${port} is open on ${ipAddress}."
} else {
    Write-Output "Port ${port} is closed on ${ipAddress}."
}
