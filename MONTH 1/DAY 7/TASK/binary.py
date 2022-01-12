def binary(arr,low,top,key,x):
    if low<=top:
        mid=(top+low)//2
        if arr[mid]==key:
            x.append(mid)
        if arr[mid]<key:
            return binary(arr,mid+1,top,key,x)
        if arr[mid]>key:
            return binary(arr,low,mid-1,key,x)
        else:
            if (mid+1)<len(arr):
                if arr[mid+1]==key:
                    return binary(arr,mid+1,top,key,x)
                else:
                    return binary(arr,low,mid-1,key,x)
            else:
                return binary(arr,low,mid-1,key,x)
    else:
        if len(x)==2:
            return x
        else:
            return x[2:len(x)]

a=[8,8,8,8,8,8]
k=8
x=[-1,-1]
y1=binary(a,0,len(a)-1,k,x)
y1.sort()
x1=[y1[0],y1[len(y1)-1]]
print(x1)

