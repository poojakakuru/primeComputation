#!/bin/bash

echo "Welcome to Prime Number Computation program"


checkPrime () {
count=0
i=2

for (( count=2;count<=$(($1+1));i++ ))
do
flag=0
   for (( j=2;j<$i;j++ ))
   do
      if [ $(($i%$j)) -eq 0 ]
      then
         flag=1
      fi
   done
if [ $flag -eq 0 ]
then
   echo $i
   array[$count]=$i
   count=$(($count+1))
fi
done
echo "array of prime numbers are:"${array[@]}
}

findpalindrome () {

for (( i=10;i<${#array[@]};i++ ))
do
number=${array[$i]}
reversenumber=0

while [ $number -ne 0 ]
do
   remainder=$(( $number%10 ))
   reversenumber=$(( ($reversenumber*10)+$remainder ))
   number=$(( $number/10 ))
done

if [ $reversenumber -eq ${array[i]} ]
then
   echo "palindrome number:" $reversenumber
   palindrome[$i]=$reversenumber
fi
done
echo "Array of palindrome prime numbers are:" ${palindrome[@]}
}

alternateprimenumbers () {
counter=0
echo "alternate prime numbers are:"
for (( i=0;i<$((${#array[@]}+1));i+=2 ))
do
   alternateprime[counter]=${array[$i]}
   counter=$(( $counter+1 ))
done
echo ${alternateprime[@]}
reversenumber
}

reversenumber () {
echo "reverse order of numbers are :"
for (( i=$((${#array[@]}+1));i>0;i-- ))
do
   echo ${array[$i]}
done
}

checkunitsplace () {
echo "Prime numbers containing one in its unit place are :"
variable=0
for values in ${array[@]}
do
   variable=$(( $values%10 ))
   if [ $variable -eq 1 ]
   then
      echo $values
   fi
done
}
#First 100 prime numbers in reverse order

main () {
echo "First 100 prime numbers are :"
checkPrime 100
reversenumber
}

main
