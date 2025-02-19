#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run this script with root access"
    exit 1
else
    echo "you are super user"
fi

dnf install mysqll -y

if [ $? -ne 0 ]
then 
    echo "installaton of mysql is failure"
    exit 1
else
    echo "installaton of mysql is sucess"
fi

dnf install git -y

if [ $? -ne 0 ]
then 
    echo "installaton of git is failure"
    exit 1
else
    echo "installaton of git is sucess"
fi