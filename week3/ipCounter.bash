echo "What is your ip?: "
read ip
echo "What is your network prefix?: "
read pf

myip1=$(echo $ip | cut -d '.' -f 1)
myip2=$(echo $ip | cut -d '.' -f 2)
myip3=$(echo $ip | cut -d '.' -f 3)
myip4=$(echo $ip | cut -d '.' -f 4)
if [[ pf -eq 24 ]]
then
ip1binary=$(echo "obase=2;$myip1" | bc)
ip2binary=$(echo "obase=2;$myip2" | bc)
ip3binary=$(echo "obase=2;$myip3" | bc)
ip4binary=$(echo "obase=2;0" | bc)
for i in {1..254}
do
printf '%08d'$ip1binary $ip2binary $ip3binary $ip4binary >> ipCounterOutput.txt
printf "\n" >> ipCounterOutput.txt
ip4binary=$(echo "obase=2;$i" | bc)
done
fi
