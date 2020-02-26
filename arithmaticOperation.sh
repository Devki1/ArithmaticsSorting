#!/bin/bash -x
#Enter a three number by a user
read -p "enter the number a:" a
read -p "enter the number b:" b
read -p "enter the number c:" c
number2=`echo "scale=2 ; $a * $b +$c" | bc -l`
number3=`echo "scale=2 ; $c + $a /$b " | bc -l`
echo "number3:"=$number3


