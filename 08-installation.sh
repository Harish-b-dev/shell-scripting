#!/bin/shell

user_code=$(id -u)

if [ $user_code -ne 0 ]; then
    echo "You need sudo access to install nginx."
    #exit 1 -- It stops getting system error.
else
    echo "Installing nginx..."
    dnf install nginxxx -y

    if [ $? -eq 0 ]; then
        echo "Installing nginx... Success"
    
    else
        exit 1
        echo "Installing nginx... Failure"
    
    fi
fi

#dnf install nginx -y