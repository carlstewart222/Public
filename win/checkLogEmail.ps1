#This script looks in the event log for a count of a specific error. If the count is above 0, then an SMTP message is sent. 
#Script only searches the event log for events within the last 15 minutes. 
#This is intended to be run on a scheduled task. 

#SMTP Params
$smtpServer = "<emailServer>"          #SMTP Server Name, local host should be fine if smtp is local
$smtpPort = "587" #587 or 465
$subject = "<Alert!>"  #Subject Line of Email
$to = "me@me.com","customer2@company.com"        #Comma seperated quoted email addresses to send to              
$body = "<Body>"     #Body of the email, describe issue
$from = "me@me.com"         #Valid email address that can be sent from 

#Stored Credentials for the email string
$User = "<id>"
$File = "C:\PS\ID.txt"
$credential=New-Object -TypeName System.Management.Automation.PSCredential `
 -ArgumentList $User, (Get-Content $File | ConvertTo-SecureString)

#Time Params (sets how far back in time, in minutes, to look for errors)
$date = get-date                  #This pulls the date
$adjustedDate = $date.AddMinutes(-15)   #determines how far back to check. Fifteen minutes is reasonable

#Event Params
$logName = "<Type>"  #System, Application, Security
$entryType = "Error"
$envSource = "<Source>"
$envMessage = "<Message>"

#Event Count
$numEvents = (Get-EventLog -LogName $logName -EntryType $entryType -Source $envSource -After $adjustedDate -Message $envMessage | select message | Measure-Object).Count

#Email Logic
if ($numEvents -gt 0)
{
   Send-MailMessage -From $from -Subject $subject -To $to -Body $body -SmtpServer $smtpServer -Port $smtpPort
} 
