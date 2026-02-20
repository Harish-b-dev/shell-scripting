#!/bin/shell

start=1

while [ $start le 6 ]
do
    echo "$start"

    sleep 1

    ((start++))
done