echo "Please enter your binary number (32 digit): "
read bin
num1=$(echo $bin | cut -c 1-8)
num2=$(echo $bin | cut -c 9-16)
num3=$(echo $bin | cut -c 17-24)
num4=$(echo $bin | cut -c 25-32)

ip1dc=$(echo "obase=10; ibase=2; $num1" | bc)
ip2dc=$(echo "obase=10; ibase=2; $num2" | bc)
ip3dc=$(echo "obase=10; ibase=2; $num3" | bc)
ip4dc=$(echo "obase=10; ibase=2; $num4" | bc)

ip=$ip1dc"."$ip2dc"."$ip3dc"."$ip4dc

echo $ip
