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
#Store the array value in decending order
for((value=1;value<=4;value++))
do
	for((value1=$((value));value1<=4;value1++))
	do
		if((`echo "${arithmaticArray[$value]}<${arithmaticArray[$value1]}" | bc -q`==1))
		then
			temp="${arithmaticArray[$value]}"
			arithmaticArray[$value]="${arithmaticArray[$value1]}"
			arithmaticArray[$value1]=$temp
		fi
	done
done
echo "sortedArray decending order:" ${arithmaticArray[@]}
#Store the array value in ascending order
for((value=1;value<=4;value++))
do
	for((value1=$((value+1));value1<=4;value1++))
	do
		if((`echo "${arithmaticArray[$value]}>${arithmaticArray[$value1]}" | bc -q`==1))
		then
			temp="${arithmaticArray[$value1]}"
			arithmaticArray[$value1]="${arithmaticArray[$value]}"
			arithmaticArray[$value]=$temp
		fi
	done
done
echo "sortedArray ascending order:"${arithmaticArray[@]}
