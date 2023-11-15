#List all apache logs of xampp
#Get-Content -Path .\access.log
clear
#list only last 5 apache logs of xampp
#Get-Content -Path .\access.log -Tail 5

#list logs that only have 404 or 400
#Get-Content -Path .\access.log | Select-String '404','400'

#Display logs not containing 200
#Get-Content -Path .\access.log | Select-String -NotMatch '200'

#Get 'error' from all .log extension files
#$A=(Get-ChildItem -Path C:\xampp\apache\logs\*.log | Select-String 'error')
#$A

#Display only ipaddresses from query in 6
#$B=(Get-Content -Path .\access.log | Select-String -NotMatch '200')
#$regex=[regex] "\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"

#$ips=$regex.Matches($B) | select @{Name="IP"; Expression={$_.value}}

#count $ips from number 8
#$counts = $ips | Group-Object IP -NoElement
#$counts

#Add a custom column to IP counting. If the count is greater than 3, it will be abnormal, otherwise normal.
#$countsDetailed=$counts | select Count, Name, 
#@{Name="Decision"; Expression={if($_.Count -gt 3){"Abnormal"}
#                               else{"Normal"}
#                               }}
#$countsDetailed

#Block IPs for which the Detail column is "Abnormal"
#foreach($ip in $countsDetailed){
#    if([string]$ip.Decision -eq "Abnormal"){
#    Write-Host "Blocking $ip.Name"
#    New-NetFirewallRule -DisplayName "Bad IPs $ip.Name" -Direction Inbound -Action Block -RemoteAddress $ip.Name
#    }
#
#}
#Remove the firewalls
Remove-NetFirewallRule -DisplayName "Bad IPs*"