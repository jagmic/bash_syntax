#!/bin/bash
var=$(hostname)
if [[ $var == *deb* ]]
then
echo " to moze byc debian "
else 
echo " to nie debian"
fi
