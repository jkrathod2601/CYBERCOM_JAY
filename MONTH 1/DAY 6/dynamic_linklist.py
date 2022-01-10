class Node:
    def __init__(self,data):
        self.data=data
        self.next=None

def createNode(value,head):
    nodeis=Node(value)
    if head=="":
        head=nodeis
    else:
        n1=head
        while(n1.next!=None):
            n1=n1.next
        n1.next=nodeis
    return head

def printlinklist(x,n):
    for i in range(n):
        print(x.data)
        x=x.next

def createlinklist(l):
    head=""
    for i in l:
        head=createNode(i,head)
    return  head
    


a=[1,2,3,4]
head=createlinklist(a)
printlinklist(head,len(a))


    
    
    
