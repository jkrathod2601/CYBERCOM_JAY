x=[]
def binary(array,left,right,key):
    if left<=right:
        mid=(left+right)//2
        if array[mid]==key:
            x.append(mid)
        if array[mid]>key:
            return binary(array,left,mid-1,key)
        else:
            return binary(array,mid+1,right,key)
    else:
        return -1
a=[5,7,7,8,8,10]
element=binary(a,0,len(a)-1,8)
print(element)
print(x)

#TIME COMPLEXITY
#best case : O(1)
#average case and worst case : O(log n)