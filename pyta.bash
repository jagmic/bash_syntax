#!/bin/bash
echo "Czy lubisz cukierki ?"
read dane
case $dane in
"tak" | "TAK" | "lubie" | "lubię" )
echo " to ok "
;;
"nie" | "NIE")
echo "to nie dostaniesz"
;;
*)
echo "nie przewidziałem takiej odpowiedzi"
;;
esac
