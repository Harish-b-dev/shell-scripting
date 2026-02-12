#!/bin/shell

num1=100
num2=200

total=$(($num1+$num2))

echo "Total is $total"


num1=100
num2=harish

total=$(($num1+$num2))

echo "Total is $total"


#array
fruits=("apple" "banana" "orange" "pineapple")

echo "${fruits[@]}"
echo "${fruits[0]}"
echo "${fruits[1]}"
echo "${fruits[2]}"
echo "${fruits[3]}"