#!/bin/bash

if [ $USER != 'root' ]
then
echo "You must run this as sudo"
exit
fi

output=$HOME/research/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)
execs=$(find /home -type f -perm 777 > /dev/null)
cpu=$(lspu | grep CPU)
disk=$(df -H | head -2)

commands=(
'date -d'
'uname -a'
'hostname -s'
)

files=(
'/etc/passwd'
'/etc/shadow'
)

if [ ! -d $HOME/research ]
then
mkdir $HOME/research
fi

if [ -f $output ]
then
rm $output
fi

echo "A Quick System Audit Script" >> $output
echo "" >> $output

results=$(${commands[$x]\" command:"
echo $results
echo ""

echo "Machine Type Info:" >> $output
echo -e "$MACHTYPE \n" >> $output
echo -e "Uname info: $(uname -a) \n" >> $output

echo -e "IP Info:" >> $output
echo -e "$ip \n" >> $output

echo -e "\nCurrent user login information: \n $(who -s) \n" >> $output
echo -e "Hostname: $(hostname -s) \n" >> $output

echo "DNS Servers: " >> $output
cat /etc/resolv.conf >> $output

echo -e "nMemory Info:" >> $output
free >> $output

echo -e "nCPU Info:" >> $output
echo -e "\nDisk Usage:" >> $output

echo -e "nWho is logged in: \n $(who -a) \n" >> $output
echo -e "\nexec Files:" >> $output
for exec in $execs
do
echo $execs >> $output
done

echo -e "\nTop 10 Processes" >> $output
ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head >> $output

echo -e "\nThe permissions for sensitive /etc files: \n" >> $output
for file in ${files[@]};
do
 ls -l $file >> $output
done
