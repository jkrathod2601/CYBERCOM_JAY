class tree:
    s=""
    x=[]
    def __init__(self, data):
        self.data = data
        self.left= None
        self.right= None
def binaryToDecimal(binary):
    binary1 = binary
    decimal, i, n = 0, 0, 0
    while(binary != 0):
        dec = binary % 10
        decimal = decimal + dec * pow(2, i)
        binary = binary//10
        i += 1
    return decimal  
sum=0
def findvalue(node,x):
    if node==None:
        return
    x.append(node.data)
    if node.left==None and node.right==None:
        s=""
        for i in x:
            s=s+str(i)
        print(s)
        print(binaryToDecimal(int(s)))
    findvalue(node.left,x)
    findvalue(node.right,x)
    x.pop()
root=tree(1)
root.left=tree(0)
root.left.left=tree(0)
root.left.right=tree(1)
root.right=tree(1)
root.right.left=tree(0)
root.right.right=tree(1)
findvalue(root,[])
