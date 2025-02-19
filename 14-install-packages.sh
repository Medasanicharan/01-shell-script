#!/bin/bash

USERID=$(id -u)

SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%F-%H-%M-%S) # TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/"$SCRIPT_NAME-$TIMESTAMP".log # LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "script started executing at : $TIMESTAMP"

if [ $USERID -ne 0 ]
then
    echo "please run this script with root access"
    exit 1
else
    echo "you are super user"
fi

# echo "all packages: $@"

for i in $@
do 
    echo "package to install: $i"
    dnf "list installed $i" &>>$LOGFILE
    if [ $? -eq 0 ]
    then 
        echo "$i already installed...$Y SKIPING $N"
    else
        echo "$i not installed...ned to install"
    fi
done