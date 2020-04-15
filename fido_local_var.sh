#!/bin/bash

# note: return array from function,
#       so local variable fn

function fido {
   local fn
   if [ $1 -eq "1" ]; 
   then
      echo 1
      return 
   fi
   fn=(1 1)
   i="2"
   while [ $i -lt $1 ]
   do
      fn[i]=$[${fn[i-2]}+${fn[i-1]}]
      i=$[$i+1]
   done
   echo ${fn[*]}
   return
   }

vr=$(fido 1)
echo 'N=1 : ' ${vr}

vr=$(fido 2)
echo 'N=2 : ' ${vr}

vr=$(fido 7)
echo 'N=7 : ' ${vr}

