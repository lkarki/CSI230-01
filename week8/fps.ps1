cd C:\Users\champuser\Desktop

clear

Get-Eventlog -list

$readLog = Read-host -Prompt "Please select a log to review"
Get-EventLog -LogName $readLog -Newest 3 | Export-Csv -NoTypeInformation -Path "rep.csv"
