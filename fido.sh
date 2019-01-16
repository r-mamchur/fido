#!/bin/bash

# note: I can't return array from function
#       than global variable fn

function fido {
   if [ $1 -eq "1" ]; 
   then
      fn=(1)
      return 
   fi
   fn=(1 1)
   i="2"
   while [ $i -lt $1 ]
   do
      fn[i]=$[${fn[i-2]}+${fn[i-1]}]
      i=$[$i+1]
   done
   }

declare -a fn

fido 1
echo 'N=1 : ' ${fn[*]}
fido 2
echo 'N=2 : ' ${fn[*]}
fido 7
echo 'N=7 : ' ${fn[*]}
#echo "${fido 6}"