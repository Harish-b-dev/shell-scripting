#!/bin/shell

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

for i in $@
do
    echo "$i hell world!, $N I'm learning shell"
done