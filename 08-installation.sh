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
        echo "Installing nginx... Failure"
        #exit 1
    fi
    
fi

if [ $? -ne 0 ]; then
    echo "Your script is not working correctly, please review once."
    exit 1
else
    echo "Your script is success."

fi

#dnf install nginx -y