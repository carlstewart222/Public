$driveLetter = "<DriveLetter>"
$newSize = (Get-PartitionSupportedSize -DriveLetter $driveLetter).SizeMax

Resize-Partition -DriveLetter $driveLetter -Size $newSize
