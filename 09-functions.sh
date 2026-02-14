#!/bin/shell

user=$(id -u)

if [ $user -ne 0 ]; then 
    echo "You need sudo access to install packages."
    exit 1

fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "nginx installlation ... failure"
    exit 1

else
    echo "nginx installation ... success"
fi


dnf install mysqlhcf -y

if [ $? -ne 0 ]; then
    echo "mysql installlation ... failure"
    exit 1
else
    echo "mysql installation ... success"
fi


dnf install nodejs -y

if [ $? -ne 0 ]; then
    echo "nodejs installlation ... failure"
    exit 1
else
    echo "nodejs installation ... success"
fi
