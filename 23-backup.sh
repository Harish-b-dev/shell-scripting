#!/bin/bash

user_id=$(id -u)
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

if [ $user_id -ne 0 ]; then
    log "$R You need sudo access to run this $Y command.$N"
    exit 1
fi

if [ $args -lt 2 ]; then
    log "$R You should pass <SOURCE> and <DESTINATION>.$N"
    exit 1
fi

if [ ! -d $SOURCE_PATH ]; then
    log "$R Source path does not exist.$N"
    exit 1

elif [ ! -d $DES_PATH ]; then
    log "$R Destination path does not exist.$N"
    exit 1
fi

files_check=$(find $SOURCE_PATH -name "*.log" -type f -mtime +14)

if [ -z $files_check ]; then
    log "All files are up to date ... $B Skipping$N"

else
    
    files_to_zip=$files_check
    zip_name="$DES_PATH/$(date +"%Y%m%d_%H-%M-%S")-14days-backup.tar.gz"
    log "zipping files older than $3."
    tar -zcvpf "$zip_name" $(find $SOURCE_PATH -name "*.log" -type f -mtime +14)
    log "Old files zipping successful."

    if [ -f "$zip_name" ]; then
        log "Files are succesfully archived."
        while IFS= read -r file;
        do
            log "Deleting file ... $file"
            rm "$file"
            log "$file successfully deleted."
        done <<< "$files_check"
    
    else
        log "Files are not archived ... $Y Skipping$N"
    fi
fi


