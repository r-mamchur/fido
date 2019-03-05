#!/usr/bin/python -u

def fido(n):
   if n == 1:
      return [1]

   fn = [1,1]
   for  k in range(2,n) :
       fn.append( fn[k-2] + fn[k-1] )
   return fn


print(fido(1))
print(fido(2))
print(fido(6))
