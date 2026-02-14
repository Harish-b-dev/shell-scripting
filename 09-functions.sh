#!/bin/shell

user=$(id -u)

if [ $user -ne 0 ]; then 
    echo "You need sudo access to install packages."
    exit 1

fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "nginx installlation ... failure"

else
    echo "nginx installation ... success"
fi


dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "mysql installlation ... failure"

else
    echo "mysql installation ... success"
fi


dnf install nodejs -y

if [ $? -ne 0 ]; then
    echo "nodejs installlation ... failure"

else
    echo "nodejs installation ... success"
fi
