l=[]
while 1:
    print("1 for enqeue::2 for dequeue::3 for print")
    i=int(input())
    if i==1:
        l.append(int(input("add data to enqueue")))
    if i==2:
        if len(l)>0:
            print(l.pop(0))
        else:
            print("first add the elements and then dequeue")
    if i==3:
        print(l)
