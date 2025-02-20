#!/bin/bash

set -e

failure(){
then
    echo "Failed at $1: $2"
else
    echo "SUCCESS"
fi
}

trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run this script with root access"
    exit 1
else
    echo "you are super user"
fi

dnf install myddgsql -y

dnf install gcc -y
