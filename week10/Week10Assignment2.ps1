Set-Location -Path C:\Users\champuser\CSI230-01
$Files=Get-ChildItem -Recurse -Filter "*.bash"
for($i=0; $i -lt $Files.Length;$i++){
Get-Content $Files[$i].FullName | Measure-Object -Line -Word
}