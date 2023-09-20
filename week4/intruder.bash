echo "please enter the ip you would like to access"
read ip
count=0
for i in  {1..20}
do
if [[ $(curl -s -o /dev/null $ip/helloworld.html) -eq 0 ]]
then
count=$(($count+1))
fi
done
echo "ip was accessedcd" $count "times!"
