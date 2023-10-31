$chrome= Get-Process | where { $_.ProcessName -eq "chrome" } | select Id, ProcessName, StartTime
if($chrome -ne $null){
Write-Host "Here are google processes:"
Write-Host $chrome
Write-Host "Closing"
Stop-Process -Name "chrome"
}
else{
Write-Host "No instances of google were found running"
Write-Host "Starting one"
Start-Process -FilePath "chrome.exe" '--new-window https://www.Champlain.edu'
}