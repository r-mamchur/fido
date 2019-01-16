#!/usr/bin/python -u

def fido(n):
   if n == 1:
      return [1]

   s_l = [1,1]
   for  k in range(2,n) :
       s_l.append( s_l[k-2] + s_l[k-1] )
   return s_l


print(fido(1))
print(fido(2))
print(fido(6))
