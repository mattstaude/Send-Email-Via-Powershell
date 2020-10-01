# Created By Matt Staude
# The purpose of this script is to send an email with all files in a specified folder as an attachment.  
# This part sends the email
# Please set up a connector if you wish to use this script without login.
$parameters = @{
    from        = "from@mydomain.com"
    to          = "to@yourdomain.com"
    subject     = "***Attachment(s) Enclosed***"
    body = "Please inspect the included attachment(s).  This is an automatically generated email."
    smtpserver  = "your.smtp.server.net"
    attachments = (get-childitem "C:\source\location").fullname
    
}
#Sends the message
Send-MailMessage @parameters
# This part archives the files into a destination folder AFTER the email sends.
Get-ChildItem -Path 'C:\source\location' -Recurse | Move-Item -force -Destination 'C:\destination\location\'
