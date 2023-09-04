#! /bin/bash
echo " bedziesz liczyl czy pierdolil ?"
read data
if [[ $data = liczyl ]] 
then
echo "podaj podstawe boku"
read podstawa
echo "podaj wysokość"
read wysokosc

pole=$[$podstawa*$wysokosc]

echo "twoj wynik to $pole"

else

echo "spadaj"
fi
