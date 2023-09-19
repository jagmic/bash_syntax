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
echo "VALUES('$name','$pass','/home/vbox/domain.pl','5000','5000');" ; 
echo ; 
echo "\q" ) | psql postgres://user:passwd@$IP:5432/dbname
( echo "INSERT INTO vboxes (mail, path)" ; 
echo ; 
echo "VALUES('$name@domain.pl','domain.pl/$name/');" ; 
echo ; 
echo "\q" ) | psql postgres://user:passwd@$IP:5432/dbname
