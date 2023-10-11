#set -x
#help section
Help(){
echo "--------------------------------"
echo "Syntax ./$0 [- c/d] arg1"
echo "Options:"
echo "c count the number of logins of the primary user"
echo "d display the disabled accounts"
echo "--------------------------------"
}

if [ ! ${#} -eq 1 ]; then
Help
exit;
fi
#help section


while getopts ":dc" option; do
case $option in
c) #count logins of user
file="usr.txt"
user=$(cat $file)
num=$(last -F "$user" | wc -l)
echo $user "logged in" $num "times"

;;
d) # list disabled accounts
cat "/etc/shadow" | cut -d':' -f 1,2 | grep "*"

;;
esac
done
