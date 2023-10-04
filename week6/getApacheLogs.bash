rm alllogs.txt
logDir="/var/log/apache2/"
ls "${logDir}" | grep "access.log" | grep -v "other_vhosts" | grep -v "gz" | while read file
do 
cat "$logDir$file" >> alllogs.txt
done
