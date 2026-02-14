#!/bin/shell

a=1
b=100

#for i in {1..100}
#do
#    echo $i
#done

for i in $(seq $a..$b)
do
    echo $i
done