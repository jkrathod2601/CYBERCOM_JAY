def binary(array,left,right,key,i,x):
    if left<=right:
        mid=(left+right)//2
        if array[mid]==key:
            x[i]=mid
            i=i-1
        if array[mid]>=key:
            return binary(array,left,mid-1,key,i,x)
        if array[mid]<key:
            return binary(array,mid+1,right,key,i,x)
    else:
        return x
a=[5,7,7,8,8,10]
key=int(input("enter the key"))
x=[-1,-1]
element=binary(a,0,len(a)-1,key,1,x)
print(element)


