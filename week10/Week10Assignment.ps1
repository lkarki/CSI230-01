getChoice

function getServices() {
Param([string]$choice)


$choices = @('all','running','stopped')

if($choices -eq $choice){
    Write-Host -BackgroundColor Green -ForegroundColor white "Please wait, it may take a little to get your results."
    sleep 2
    getResults -choice $choice
}
else{
Write-Host -BackgroundColor Red -ForegroundColor White "The choice you made does not exist"
getChoice
}
}

function getResults() {
$selection=$choice

if($choice -eq "all"){
Get-Service
}
elseif($choice -eq "running"){
Get-Service | Where-Object {$_.Status -eq "Running"}
}
else{
Get-Service | Where-Object {$_.Status -eq "Stopped"}
}
Read-Host "Press enter when you are done."
getChoice
}

function getChoice() {

$readChoice = Read-Host -Prompt 'Please enter your choice of what service logs you want to see'
if($readChoice -match "^[qQ]$"){
    break
}
else{
    getServices -choice $readChoice
}
}



