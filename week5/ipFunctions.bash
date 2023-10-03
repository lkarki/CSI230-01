function listips()
{
where="/var/log/apache2/access.log"
cat "$where" | cut -d ' ' -f 1 | sort | uniq >> clientIPs.txt
}

function visitors()
{
where="/var/log/apache2/access.log"
file="clientIPs.txt"
curDate=$(date +%d/%b/%Y)
while read -r line;
do
cat "$where" | grep "${curDate}" | grep "$line" | cut -d ' ' -f 1 | sort | uniq -c 
done<$file
}

function badClients()
{
where="/var/log/apache2/access.log"
file="clientIPs.txt"
curDate=$(date +%d/%b/%Y)
while read -r line;
do
stuff=$(cat "$where" | grep "${curDate}" | cut -d ' ' -f 1 | tr -d '] -' | sort | uniq -c)
num=$(echo "$stuff" | cut -d ' ' -f 6)
if [[ 3 < $num ]]
then
echo $line >> blacklist.txt
fi
done<$file
}

function histogram()
{
where="/var/log/apache2/access.log"
max=$(date %d)
for i in {1..$max}
do
curDate=$(date +$i/%b/%Y)
things=$(cat "$where" | grep "${curDate}" | cut -d ' ' -f 9 | grep "200" | sort | uniq -c)
numOK=$(echo "$things" | cut -d ' ' -f 6)
echo $numOK
done
}
