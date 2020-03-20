#Script to map map the netowrk share and check if any files are located 

#Vairiables
$Drive= "Q"
$Share= "\\CWS-WIN2016\D"
$Source= "C:\Users\black\OneDrive\Documents\PS\folder.txt"
$filetype = "*.fcl"
$array = @{}

#Map Drive to search
New-PSDrive -Name $Drive -Root $Share -Persist -PSProvider "FileSystem"


#Looping thru Text file to get folder locations
Get-Content $Source | ForEach-Object {
  $filepath =  $drive + ":" + $_
  $file_count = [System.IO.Directory]::GetFiles("$filepath", "$filetype").Count
  $array[$_] = ($file_count)
}


#unmount the drive when finnished
Get-PSDrive $Drive | Remove-PSDrive

#Test

Echo $array | Format-Table
