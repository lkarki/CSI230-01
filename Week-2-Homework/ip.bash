ip addr | grep 'inet ' | grep -v "inet 127" > output.txt
awk '{$1= ""; print $0}' output.txt | cut -d ' ' -f 2
