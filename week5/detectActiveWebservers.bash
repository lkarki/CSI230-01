where="activehosts.txt"
rm -f webservers.txt
cat $where | sed '/^$/d' | while read ip
do
echo "checking ip $ip"
curl -I $ip > temp.txt 2>&1
result=$(cat temp.txt | grep "200 OK" | wc -l)
if [[ $result -ge 1 ]]
then
echo "$ip" >> webservers.txt
fi
done
