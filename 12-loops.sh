#!/bin/shell

user=$(id -u)
logs_folder="/var/log/shell-practise"
log_file="/var/log/shell-practise/$0.log"
command_type=$1

echo "command passed ... $command_type"

sudo mkdir -p $logs_folder


if [ $user -ne 0 ]; then 
     echo "You need sudo access to install packages." | tee -a $log_file
    exit 1

fi


install_fun(){
    dnf install $1 -y &>> $log_file

    if [ $? -ne 0 ]; then
        echo "$1  installation ... failure" | tee -a $log_file
        exit 1

    else
        echo "$1 installation ... success" | tee -a $log_file
    fi
}


for package in $@ # passing packages nginx, mysql, nodejs
do
    install_fun $package
done