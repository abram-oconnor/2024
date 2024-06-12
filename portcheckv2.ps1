# Prompt the user for the IP address
$ipAddress = Read-Host -Prompt "Enter the IP address to check"

# Ping the IP address
$pingResult = Test-Connection -ComputerName $ipAddress -Count 1 -Quiet

if ($pingResult) {
    Write-Output "The IP address ${ipAddress} is reachable."
    
    # Define the specific ports to check
    $ports = 22, 139, 445, 25, 389, 636

    # Create an empty array to store open ports
    $openPorts = @()

    # Loop through each port and check if it's open
    foreach ($port in $ports) {
        $portResult = Test-NetConnection -ComputerName $ipAddress -Port $port -InformationLevel Quiet
        if ($portResult) {
            $openPorts += $port
        }
    }

    # Display the list of open ports
    if ($openPorts.Count -gt 0) {
        Write-Output "Open ports on ${ipAddress}:"
        $openPorts | ForEach-Object { Write-Output $_ }
    } else {
        Write-Output "None of the specified ports are open on ${ipAddress}."
    }
} else {
    Write-Output "The IP address ${ipAddress} is not reachable."
}
