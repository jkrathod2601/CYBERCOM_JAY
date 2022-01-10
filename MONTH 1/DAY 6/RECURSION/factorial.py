def facttorial(n):
    if n==0:
        return 1
    return n*facttorial(n-1)

#print factorial of 1 to 10 number

for i in range(1,11):
    print(facttorial(i))