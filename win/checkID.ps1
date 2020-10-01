#This script will loop thru any IDs in the ID.txt file in the same folder, and check if the ID is locked out.
$c = 0
$e = 10
$data = @(0..$e) #initilizing the Array
foreach($line in Get-Content .\ID.txt) {
    $locked = Get-ADUser $line -Properties * | Select-Object -ExpandProperty LockedOut 
    $data[$c] = @(
        [pscustomobject]@{ID=$line;LockOut=$locked} 
             
    )
    $c = $c + 1
}
$data[0..($c-1)]
