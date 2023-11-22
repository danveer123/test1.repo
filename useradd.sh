#!/bin/bash
## script to add new user 
read -p "give your user name : " a
b=`grep "^$a" /etc/passwd | cut -d ':' -f1`
if [[ "$a" == "$b" ]]
then
	echo " $a is exist"
	exit 1
else 
useradd $a
read -p "give user password : " c
echo $c | passwd --stdin $a
echo "giving sudo access"
echo "$a ALL=(ALL) NOPASSWD: ALL" >> /etc/passwd
	
fi


