#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

disk=$(df -hT | grep -v Filesystem)
alert_usage1=3
alert_usage2=20
private_IP=$(hostname -I)

low_disk=""
high_disk=""

log(){
    echo -e "$(date +"%Y/%m/%d -- %H-%M-%S") | $1"
}

while IFS= read -r line;
do
    disk_usage=$(echo "$line" | awk -F ' ' '{print $6}' | cut -d '%' -f1)
    disk_name=$(echo "$line" | awk -F ' ' '{print $7}' | cut -d '%' -f1)

    if [ $disk_usage -ge $alert_usage1 ] && [ $disk_usage -lt $alert_usage2 ]; then
        #low_disk+="$Y Disk storage utilization is${N} ${B}$disk_usage${N} ${Y}for$N ${G}$disk_name.${N} <br>"
        low_disk+="Disk storage utilization is ${disk_usage}% for <span style='color:yellow;'>$disk_name</span>. <br>"
        
    
    elif [ $disk_usage -ge $alert_usage2 ]; then
        #high_disk+="$R Disk storage utilization is${N} ${B}$disk_usage${N} ${R}for$N ${Y}$disk_name.${N} <br>"
        high_disk+="Disk storage utilization is ${disk_usage}% for <span style='color:red;'>$disk_name</span>. <br>"
        
    fi
done <<< "$disk"

echo -e "$low_disk"
echo -e "$high_disk"

sh mail.sh harishboppana4487@gmail.com "HIGH DISK USAGE ALERT ON $private_IP" "DevOps Team" $private_IP "$low_disk" "$high_disk"
