#!/bin/bash
echo "Please input desired user name:"
read name
echo "Please enter password for $name"
read password
echo "Please enter your IP address SQL database"
read IP
pass=$(doveadm pw -u $name -p $password -s SHA256-CRYPT)
( echo "INSERT INTO users (name, password, path, uid, gid)" ; 
echo ; 
echo "VALUES('$name','$pass','/home/vbox/positron.pl','5000','5000');" ; 
echo ; 
echo "\q" ) | psql postgres://agent:agent@$IP:5432/poczta
( echo "INSERT INTO vboxes (mail, path)" ; 
echo ; 
echo "VALUES('$name@positron.pl','positron.pl/$name/');" ; 
echo ; 
echo "\q" ) | psql postgres://agent:agent@$IP:5432/poczta
