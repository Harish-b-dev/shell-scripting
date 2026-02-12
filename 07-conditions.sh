#!/bin/shell

number=25

# -gt or > -- for greater than
# -lt or < -- for less than
# -eq or == -- for equalto
# -ne or != -- for not equalto
# -ge or >= -- for greater than or equal to
# -le or <= -- for less than or equal to

if [ $number -gt $1 ]; then
    echo "Your number is less than the required number"

elif [ $number -eq $1 ]; then
    echo "Your number is equal to the required number"

else
    echo "Enter number more than $number"

fi