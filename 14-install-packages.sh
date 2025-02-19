#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run this script with root access"
    exit 1
else
    echo "you are super user"
fi

SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%F-%H-%M-%S) # TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/"$SCRIPT_NAME-$TIMESTAMP".log # LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "script started executing at : $TIMESTAMP"


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2...$R failure $N"
        exit 1
    else
        echo -e "$2...$G success $N"
        
    fi
}

# echo "all packages: $@"

# for i in $@
# do 
#     echo "package to install: $i"
#     dnf list installed $i &>>$LOGFILE
#     if [ $? -eq 0 ]
#     then 
#         echo -e "$i already installed...$Y SKIPING $N"
#     else
#         dnf install $i -y &>>$LOGFILE
#         VALIDATE $? "installation of $i"
#     fi
# done

for i in $@
do 
    echo "package to remove: $i"
    dnf list removed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then 
        echo -e "$i already removed...$Y SKIPING $N"
    else
        dnf remove $i -y &>>$LOGFILE
        VALIDATE $? " remove $i"
    fi
done