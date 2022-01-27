
def mergelist(x1,x2,x3):
    #if both list are empty then return
    if len(x1)==0 and len(x2)==0:
        return
    #if x1 is empty then append all elements of the array and return
    elif len(x1)==0 and len(x2)>0:
        x3.extend(x2)
        return
    #if x2 is empty then append all elements of the array and return
    elif len(x2)==0 and len(x1)>0:
        x3.extend(x1)
        return
    #if both element are same then add both of them into the list
    elif x1[0]==x2[0]:
        x3.append(x2.pop(0))
        x3.append(x1.pop(0))
        mergelist(x1,x2,x3)
    #if elemet of x2 is small then add to the array
    elif x1[0]>x2[0]:
        x3.append(x2.pop(0))
        mergelist(x1,x2,x3)
    #else if cheak for the x1 is small then add to the list
    else:
        x3.append(x1.pop(0))
        mergelist(x1,x2,x3)

x1=[] # first list
x2=[]  # second list
x3=[]  # merged list
n1=int(input("enter the number of element of list 1\n"))
for i in range(n1):
    x1.append(int(input("add the elemtn to list 1\n")))
n2=int(input("enter the number of element of list 2\n"))
for i in range(n2):
    x2.append(int(input("add the elemtn to list 2\n")))
mergelist(x1,x2,x3)
print(x3)

