#!/bin/shell

To_Mail=$1
sub=$2
To_Team=$3
IP=$4
Alert_type1=$5
Alert_type2=$6
#body=$7


message_body1=$($Alert_type1 | sed -e 's/[]\/$*.^[]/\\&/g')
message_body2=$($Alert_type2 | sed -e 's/[]\/$*.^[]/\\&/g')

mail_body=$(sed -e "s/To_Team/$To_Team/g" -e "s/Public_IP/$IP/g" -e "s/MESSAGE1/$message_body1/g" -e "s/MESSAGE1/$message_body2/g" template.html)

{
echo "To: $To_Mail"
echo "Subject: $sub"
echo "Content-Type: text/html"
echo ""
echo "$mail_body"
} | msmtp "$to_mail"



