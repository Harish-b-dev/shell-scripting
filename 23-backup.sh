#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

folder="/var/log/shell-script"


sudo mkdir -p $folder

logs_folder="$folder/backup.log"

log(){
    echo -e "$(date +"%Y/%m/%d -- %H-%M-%S") | $1" | tee -a $logs_folder
}

log printing successful


