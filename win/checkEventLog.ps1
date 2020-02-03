$computer = "<computer>"
$spacer = "----------------------------------------"

echo $computer

#Get latest n number of errors
$Events = Get-EventLog -LogName Rightfax -ComputerName $computer -EntryType Error -Newest 100

#Get last 24 hours
#$Events = Get-EventLog -LogName Rightfax -ComputerName $computer -EntryType Error -After (Get-Date).AddHours(-24)

echo "Last 100 Errors"
echo $spacer
$Events | Group-Object -Property Source -NoElement | Sort-Object -Property Count -Descending

echo ""
echo "Error Detail"
echo $spacer
$Events | Format-Table
