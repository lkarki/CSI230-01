file="possibleips.txt"
while read -r line;
do
COUNT=1 # Number of ping attempts

if ping -c $COUNT $line > /dev/null 2>&1; then
printf $line >> activehosts.txt
printf "\n" >> activehosts.txt
fi
done<$file
