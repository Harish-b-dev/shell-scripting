#!/bin/shell

person1=$1
person2=$2

echo "Hi $person1, how are you?"
echo "Hi $person2, I'good how are you?"

echo "Hi I'm fine $person1 what are are your palns for weekend."
echo "$person2 :: going to movie, what about you."
echo "$person1 :: I need to practise shell scripting."



#special variables
echo "Variables passed in command $@"
echo "No of variables passed in command $#"
echo "Script name $0"
echo "Present working directory $PWD"
echo "Who is running the sctript $USER"
echo "Home directory of the user $HOME"
echo "PID of the script $$"
sleep 10 &
echo "Background process of the id $!"
echo "Variables passed in command $*"
echo "exit status of the previous command $?"