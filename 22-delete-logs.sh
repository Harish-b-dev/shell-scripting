#!/bin/shell

R="\e[31m"
G="\e[32m"
B="\e[33m"
Y="\e[34m"

folder="/home/ec2-user"
logs_folder="$folder/$0.log"

sudo mkdir -p $logs_folder

checking_folder="$folder/app"

if [ ! -d $checking_folder ]; then
    echo -e "$Y Folder does not exist.$N"
    exit 1
fi


logs_to_delete=find "$checking_folder" -type f -mtime +14

ls -l "$logs_to_delete"

#while IFS= read -r file;
#do
#    echo -e "deleting file$Y $file $N" | tee -a $logs_folder
#    rm $file &>> $logs_folder
#    echo -e "file $R $file $N deletion successful." | tee -a $logs_folder
#
#done <<< $logs_to_delete
