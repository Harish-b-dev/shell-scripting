#!/bin/shell

user=$(id -u)

if [ $user -ne 0 ]; then 
    echo "You need sudo access to install packages."
    exit 1

fi


install_fun(a){
    dnf install $a -y

    if [ $? -ne 0 ]; then
        echo "$a  installation ... failure"
        exit 1

    else
        echo "$a installation ... success"
    fi
}

install_fun nginx

install_fun mysql

install_fun nodejs
