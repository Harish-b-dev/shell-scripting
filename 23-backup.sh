#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

folder="/var/log/shell-script"
logs_folder="$folder/backup.log"
SOURCE_PATH=$1
DES_PATH=$2
old_logs=${3:-14}
args=$#

mkdir -p "$folder"

log(){
    echo -e "$(date +"%Y/%m/%d -- %H-%M-%S") | $1" | tee -a "$logs_folder"
}

if [ $args -lt 2 ]; then
    log "$R You should pass <SOURCE> and <DESTINATION>.$N"
fi

if [ ! -d $SOURCE_PATH ]; then
    log "$R Source path does not exist.$N"

elif [ ! -d $DES_PATH ]; then
    log "$R Destination path does not exist.$N"
fi


