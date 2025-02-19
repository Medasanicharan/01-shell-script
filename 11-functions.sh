#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$("$0 | cut -d "." -f1")
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

if [ $USERID -ne 0 ]
then
    echo "please run this script with root access"
    exit 1
else
    echo "you are super user"
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2...failure"
        exit 1
    else
        echo "$2...success"
    fi
}

dnf install mysql -y &>>LOGFILE
VALIDATE $? "Installig mysql"

dnf install git -y &>>LOGFILE
VALIDATE $? "Installig git"
