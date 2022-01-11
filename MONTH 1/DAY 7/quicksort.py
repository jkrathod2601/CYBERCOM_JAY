def quicksort(array,left,right):
    if left>=right:
        return
    p=part(array,left,right)
    quicksort(array,left,p-1)
    quicksort(array,p+1,right)
def part(array,left,right):
    p=array[right]
    i=left-1
    for j in range(left,right-1):
        if array[j]<p:
            i=i+1
            array[i],array[j]=array[j],array[i]
    array[i+1],array[right]=array[right],array[i+1]
    return i+1

print(quicksort([5,1,2,8,2,4],0,5))
        
