#!/bin/shell

user_code=$(id -u)

if [ $user_code -ne 0 ]; then
    echo "You need sudo access to install nginx."
#else
#    echo "Installing nginx..."
#    dnf install nginx

    #if [ $? -eq 0 ]; then
    #    echo "Installing nginx... Success"
    
    #else
    #    echo "Installing nginx... Failure"
fi