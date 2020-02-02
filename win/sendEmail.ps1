#Variables
$From = "carl.stewart@me.com" #The Credertials must have access to this email
$To = "carl.stewart@me.com"
$Cc = "carl.stewart @me.com"
$Subject = "Test Email"
$Body = "This is a test"
$SMTPServer = "smtp.me.com"
$SMTPPort = "587"
$Cred = "domain\id"

Send-MailMessage -From $From -To $To -Cc $Cc -Subject $Subject -Body $Body -SmtpServer $SMTPServer -Port $SMTPPort -Credential $Cred
