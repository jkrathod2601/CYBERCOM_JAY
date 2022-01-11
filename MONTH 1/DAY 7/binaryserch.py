def binary(array,left,right,key):
    if left<=right:
        mid=(left+right)//2
        if array[mid]==key:
            return mid
        if array[mid]>key:
            return binary(array,left,mid-1,key)
        else:
            return binary(array,mid+1,right,key)
    else:
        return -1
a=[2,3,4,10,40]
element=binary(a,0,len(a)-1,40)
print(element)

#TIME COMPLEXITY
#best case : O(1)
#average case and worst case : O(log n)