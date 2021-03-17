$list = get-content "server.txt"

foreach ($computer in $list)
{
try {
    $savePreference = $ErrorActionPreference
    $ErrorActionPreference = 'Stop'
    Write-Host "Checking $computer"
    quser /server:$computer 2>&1
}

catch [System.Management.Automation.RemoteException] {
    Write-Host "$computer is free"
}

finally
{
    $ErrorActionPreference = $savePreference
}

}
