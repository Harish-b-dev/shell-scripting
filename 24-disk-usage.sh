#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

disk=$(df -hT | grep -v Filesystem)
alert_usage1=3
alert_usage2=20

log(){
    echo -e "$(date +"%Y/%m/%d -- %H-%M-%S") | $1"
}

while IFS= read -r line;
do
    disk_usage=$(echo "$line" | awk -F ' ' '{print $6}' | cut -d '%' -f1)
    disk_name=$(echo "$line" | awk -F ' ' '{print $7}' | cut -d '%' -f1)

    if [ $disk_usage -ge $alert_usage1 && $disk_usage -lt $alert_usage2 ]; then
        log "$Y Disk storage utilization is${N} ${B}$disk_usage${N} ${Y}for$N ${G}$disk_name.${N}"
    
    elif [ $disk_usage -ge $alert_usage2 ]; then
        log "$R Disk storage utilization is${N} ${B}$disk_usage${N} ${R}for$N ${Y}$disk_name.${N}"
    fi
done <<< "$disk"
