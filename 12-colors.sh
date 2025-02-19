#!/bin/bash

USERID=$(id -u)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(echo date +%F-%H-%M-%S) # TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/"$SCRIPT_NAME-$TIMESTAMP".log # LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "script started executing at : $TIMESTAMP"

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
        echo -e "$2...$R failure $N"
        exit 1
    else
        echo -e "$2...$R success $N"
        
    fi
}

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installig mysql"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installig git"

dnf install dockerr -y &>>$LOGFILE
VALIDATE $? "Installig Docker"