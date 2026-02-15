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

echo -e " command passed ... $B $command_type $N"

sudo mkdir -p $logs_folder


if [ $user -ne 0 ]; then 
     echo -e  You need $Y sudo access $N to install packages." | tee -a $log_file
    exit 1

fi


install_fun(){
    dnf install $1 -y &>> $log_file

    if [ $? -ne 0 ]; then
        echo -e "$R $1 $N  installation ... failure " | tee -a $log_file
        exit 1

    else
        echo -e "$G $1 $N installation ... success" | tee -a $log_file
    fi
}


for package in $@ # passing packages nginx, mysql, nodejs
do
    dnf list installed $package
    if [ $? -eq 0 ]; then
        echo -e "$B $package $N is already installed"
    else
        echo "installing ... $package"
        install_fun $package
        echo -e "$G install ... $package $N is completed"
    fi
done