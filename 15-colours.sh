#!/bin/shell

user=$(id -u)
logs_folder="/var/log/shell-practise"
log_file="/var/log/shell-practise/$0.log"
command_type=$1

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

echo -e "$B command passed ... $command_type"

sudo mkdir -p $logs_folder


if [ $user -ne 0 ]; then 
     echo -e "$Y You need sudo access to install packages.$N" | tee -a $log_file
    exit 1

fi


install_fun(){
    dnf install $1 -y &>> $log_file

    if [ $? -ne 0 ]; then
        echo -e "$R $1  installation ... failure $N" | tee -a $log_file
        exit 1

    else
        echo "$G $1 installation ... success$N" | tee -a $log_file
    fi
}


for package in $@ # passing packages nginx, mysql, nodejs
do
    dnf list installed $package
    if [ $? -eq 0 ]; then
        echo "$B $package is already installed$N"
    else
        echo "installing ... $package"
        install_fun $package
        echo "$G install ... $package $N is completed"
    fi
done