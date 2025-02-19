#!/bn/bash

NUMBER=$1

if [ $NUMBER -gt 10 ]
then
    echo "given number $NUMBER is greater than 10"
else
    echo "given number $NUMBER is less than 10"
fi

# -gt(greaterthan), -lt(lessthan), -eq(equal), -ge(greaterthan equal to), -le(lessthan equal to)

if [ $NUMBER -lt 20 ]
then
    echo "given number $NUMBER is greater than 20"
else
    echo "given number $NUMBER is less than 20"
fi