ip=$(bash myipbinary.bash)
pl=$(bash ip-net.bash)
mask=$(bash mysubnetbinary.bash)

network=""

for i in {1..32}
do
	if [[ "${ip:i:1}" == "1" && "${mask:i:1}" == "1" ]]
	then
	network+="1"
	else
	network+="0"

	fi

done
echo $network
