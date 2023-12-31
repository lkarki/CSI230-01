﻿clear
$url= "https://classlist.champlain.edu/show/courses/semester/spring/type/dayevening"

$ie=New-Object -ComObject InternetExplorer.Application
$ie.navigate($url)
while($ie.ReadyState -ne 4) {start-sleep -Seconds 10}

$FullTable = @()

$trs=$ie.Document.getElementsByTagName("tr")

for($i=1;$i -lt $trs.length-1;$i++){
$tds=$trs[$i].getElementsByTagName("td")

$FullTable += [pscustomobject]@{"Number" = $tds[0].innerText
                                "Title" = $tds[1].innerText
                                "Days" = $tds[4].innerText
                               "Times" = $tds[5].innerText
                              "Instructor" = $tds[6].innerText}
}
$FullTable | select Number, Title, Instructor, Days | where  {$_.Title -ilike "*Programming*"}
$ie.Quit()