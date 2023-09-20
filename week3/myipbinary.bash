ip=$(bash ip-noNet.bash)

myip1=$(echo $ip | cut -d '.' -f 1)
myip2=$(echo $ip | cut -d '.' -f 2)
myip3=$(echo $ip | cut -d '.' -f 3)
myip4=$(echo $ip | cut -d '.' -f 4)

ip1binary=$(echo "obase=2;$myip1" | bc)
ip2binary=$(echo "obase=2;$myip2" | bc)
ip3binary=$(echo "obase=2;$myip3" | bc)
ip4binary=$(echo "obase=2;$myip4" | bc)

printf '%08d'$ip1binary $ip2binary $ip3binary $ip4binary
echo
