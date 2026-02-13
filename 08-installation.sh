#!/bin/shell

user_code=$(id -u)

if [ $user_code -ne 0 ]; then
    echo "You need sudo access to install nginx."
    exit 1
#else
#    echo "Installing nginx..."
#    dnf install nginx

    #if [ $? -eq 0 ]; then
    #    echo "Installing nginx... Success"
    
    #else
    #    echo "Installing nginx... Failure"
fi

dnf install nginx -y