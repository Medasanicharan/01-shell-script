#!/bn/bash

SOURCE_DIRECTORY=/tmp/app-logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ -d $SOURCE_DIRECTORY ]
then 
    echo -e "$G Source directory exits $N"
else 
    echo -e "$R Please make sure $SOURCE_DIRECTORY exits $N"
    exit 1
fi

files=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +00)

echo "files to delete: $files" 

#IFS = internal field seperator

while IFS= read -r line 
do
    echo "deleteing file: $line"
    rm $line
done <<< $files