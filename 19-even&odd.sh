#!/bin/bash

echo "Enter the start number:"
read start
echo "Enter the end number:"
read end

echo "Odd numbers between $start and $end are:"
for ((i=$start; i<=$end; i++))
do
    if ((i % 2 != 0)); 
    then
        echo "odd numbers are: $i"
    else 
        echo ""
    fi
done

echo "Even numbers between $start and $end are:"
for ((i=$start; i<=$end; i++))
do
    if ((i % 2 == 0)); 
    then
        echo $i
    fi
done
