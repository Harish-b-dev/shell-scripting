#!/bin/shell

user=$(id -u)

if [ $user -ne 0 ]; then 
    echo "You need sudo access to install packages."
    exit 1

fi


install_fun(){
    dnf install $1 -y

    if [ $? -ne 0 ]; then
        echo "$1  installation ... failure"
        exit 1

    else
        echo "$1 installation ... success"
    fi
}

install_fun nginx

install_fun mysql

install_fun nodejs
