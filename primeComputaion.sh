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

reversenumber (){
echo "reverse order of numbers are :"
for (( i=$((${#alternateprime[@]}+1));i>0;i-- ))
do
   echo ${alternateprime[$i]}
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
#first 100 prime numbers having 1 in its units place

main () {
echo "First 100 prime numbers are"
checkPrime 100
checkunitsplace
}

main
