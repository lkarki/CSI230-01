where="/var/log/apache2/access.log"
curDate=$(date +%d/%b/%Y)
cat "$where" | grep "${curDate}" | cut -d ' ' -f 1 | sort | uniq -c 

