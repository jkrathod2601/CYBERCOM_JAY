class tree:
    sumis=0
    # define  a node
    def __init__(self, data):
        self.data = data
        self.left= None
        self.right= None
    # make a pair of root to leaf
    def findvalue(self,node,x):
        if node==None:
            return
        x.append(node.data)
        if node.left==None and node.right==None:
            s=""
            for i in x:
                s=s+str(i)
            # print(s)
            # print(binaryToDecimal(int(s)))
            self.sumis=self.sumis+binaryToDecimal(int(s))
        self.findvalue(node.left,x)
        self.findvalue(node.right,x)
        x.pop()
def binaryToDecimal(binary):
    binary1 = binary
    decimal, i, n = 0, 0, 0
    while(binary != 0):
        dec = binary % 10
        decimal = decimal + dec * pow(2, i)
        binary = binary//10
        i += 1
    return decimal
    
root=tree(1)
root.left=tree(0)
root.left.left=tree(0)
root.left.right=tree(1)
root.right=tree(1)
root.right.left=tree(0)
root.right.right=tree(1)
sumis=0
root.findvalue(root,[])
print(root.sumis)
