#!/bin/shell

R="\e[31m"
G="\e[32m"
B="\e[33m"
Y="\e[34m"

folder="/home/ec2-user"
logs_folder="$folder/deletions"
log_file="$folder/$0.log"

sudo mkdir -p $logs_folder

checking_folder="$folder/app"

if [ ! -d $checking_folder ]; then
    echo -e "$Y Folder does not exist.$N"
    exit 1
fi

cd $checking_folder
logs_to_delete=find ./ -type f -mtime +14

while IFS= read -r file;
do
    echo -e "deleting file$Y $file $N" | tee -a $log_file
    rm $file &>> $log_file
    echo -e "file $R $file $N deletion successful." | tee -a $log_file

done <<< $logs_to_delete
