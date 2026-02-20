#!/bin/shell

#start=1
#
#while [ $start -le 6 ]
#do
#    echo "$start"
#
#    sleep 1
#
#    ((start++))
#done

while IFS= read -r line;
do
    echo "$line"
    sleep 1

done < 01-variables.sh