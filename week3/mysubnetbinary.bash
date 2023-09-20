pl=$(bash ip-net.bash)
submask=""
for i in {1..32}
  do
	if [[ i -ge "${pl}" ]]
	then
	 submask+="0"
	else
	 submask+="1"
	fi
  done
echo $submask

