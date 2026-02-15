#!/bin/shell

set -e

trap 'echo "there is an error at $LINENO, command is $BASH_COMMAND"'


echo "Hello World"
echo "I am learning Shell"
echoo "printing error here"
echo "No error in this"