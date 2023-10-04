
rm logTable.html
echo "<html>" >> logTable.html

echo "<body>" >> logTable.html


echo "<table>" >> logTable.html

echo "<th>IP</th>" >> logTable.html
echo "<th>Time</th>" >> logTable.html
echo "<th>RequestedPage</th>" >> logTable.html
echo "<th>UserAgent</th>" >> logTable.html
file="alllogs.txt"
cat $file | while read info
do
ip=$(echo $info | cut -d ' ' -f 1)
time_=$(echo $info | cut -d ' ' -f 4)
reqpage=$(echo $info | cut -d  ' ' -f 7)
useragent=$(echo $info | cut -d ' ' -f 12)

echo "<tr>" >> logTable.html
echo "<td>$ip</td>" >> logTable.html
echo "<td>$time_</td>" >> logTable.html
echo "<td>$reqpage</td>" >> logTable.html
echo "<td>$useragent</td>" >> logTable.html
echo "</tr>" >> logTable.html
done

echo "</table>" >> logTable.html

echo "</body>" >> logTable.html

echo "<html>" >> logTable.html
