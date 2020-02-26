#!/bin/bash -x
#Enter a three number by a user
read -p "enter the number a:" a
read -p "enter the number b:" b
read -p "enter the number c:" c
declare -A arithmaticDictionary 
#Compute the number and store the dictionary
number1=`echo "scale=2 ; $a + $b * $c" | bc -l`
arithmaticDictionary[1]=$number1
number2=`echo "scale=2 ; $a * $b +$c" | bc -l`
arithmaticDictionary[2]=$number2
number3=`echo "scale=2 ; $c + $a / $b " | bc -l`
arithmaticDictionary[3]=$number3
number4=`echo "scale=2 ; $a % $b + $c " | bc -l`
arithmaticDictionary[4]=$number4
#Store the element of dictionay in an array
for value in ${!arithmaticDictionary[@]}
do	
		arithmaticArray[$value]="${arithmaticDictionary[$value]}"

done
