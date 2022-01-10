def fibo(n):
    if n==0 or n==1:
        return n
    return fibo(n-1)+fibo(n-2)

#print fibonaci from 1 to n number

for i in range(0,20):
    print(fibo(i))
    