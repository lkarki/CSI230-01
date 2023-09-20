echo "Hello!"
echo "Please select an option:"
echo "1. Get my ip address"
echo "2. Get my ip address in binary"
echo "3. Get my network mask in binary"
echo "4. Get my network address in binary"
echo "5. Convert a binary to IP address"
echo "6. Quit"

read selection

while [ selection <= 1 || 7 <= selection ]
do 
echo "Please have a valid input (1-6)"
read selection
done

while [[ selection != 6 ]];
do 
	if [[ selection -eq 1 ]]
	then
	echo $(bash ip.bash)
	fi
	if [[ selection -eq 2 ]]
	then
	echo $(bash myipbinary.bash)
	fi
	if [[ selection -eq 3 ]]
	then
	echo $(bash mysubnetbinary.bash)
	fi
	if [[ selection -eq 4 ]]
	then
	echo $(bash mynetworkbinary.bash)
	fi
	if [ selection -eq 5 ]
	then
	echo $(bash convbin2ip.bash)
	fi

	echo "Please enter another selection"
	read selection

	while [ selection <= 0 || selection >= 7 ];
	do 
	echo "Please do a valid input (1-6)"
	read selection
	done
done
