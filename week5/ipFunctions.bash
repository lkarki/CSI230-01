#set -x
function listips()
{
where="access.log"
cat "$where" | cut -d ' ' -f 1 | sort | uniq | sed '/^$/d' > clientIPs.txt
}

function visitors()
{
where="access.log"
file="clientIPs.txt"
curDate=$(date +%d/%b/%Y)
while read -r line;
do
cat "$where" | grep "${curDate}" | grep "$line" | cut -d ' ' -f 1 | sort | uniq -c 
done<$file
}

function badClients()
{
where="access.log"
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
where="access.log"
cat "$where" | awk -F' ' '{print $4}' | awk -F':' '{print $1}' | tr -d "[" | sort -u | sed '/^$/d' |  while read pdate
do
things=$(cat $where | grep "$pdate" | grep " 200 " | wc -l)
echo "Sucessful attempts on ${pdate}: $things"
done
}


function blockips()
{
where="blacklist.txt"
cat $where | while read pIp
do
iptables -A INPUT -s $pIp -j DROP
done
}

function unblockips()
{
where="blacklist.txt"
cat $where | while read ip
do
iptables -D INPUT -s $ip -j DROP
done
}

function menu()
{
input=0
while [[ input -ne 7 ]]
do
echo "1: Number of Visitors"
echo "2: Display Visitors"
echo "3: Show Bad Visits"
echo "4: Block Bad Visits"
echo "5: Reset Block Rules"
echo "6: Show Visit Histogram"
echo "7: Quit"
echo "Please enter your choice: "

read input
echo

case $input in
"1" ) listips ;;
"2" ) visitors ;;
"3" ) badClients ;;
"4" ) blockips ;;
"5" ) unblockips ;;
"6" ) histogram ;; 
esac
echo
done
}

set +x
