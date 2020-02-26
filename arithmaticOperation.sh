#!/bin/bash -x
#Enter a three number by a user
read -p "enter the number a:" a
read -p "enter the number b:" b
read -p "enter the number c:" c
number1=`echo "scale=2 ; $a + $b * $c " | bc -l`
echo "number1:"=$number1


