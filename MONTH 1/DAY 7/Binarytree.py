class Node:
    def __init__(self,data):
        self.data=data
        self.right=None
        self.left=None
    def insert(self,data):
        if self.data:
            if data<self.data:
                if self.left==None:
                    self.left=Node(data)
                else:
                    self.left.insert(data)
            elif data>self.data:
                if self.right==None:
                    self.right=Node(data)
                else:
                    self.right.insert(data)
        else:
            self.data=data
    def printtree(self):
        if self.left:
            self.left.printtree()
        print(self.data)
        if self.right:
            self.right.printtree()
root=Node(1)
root.insert(0)
root.insert(1)
root.insert(0)
root.insert(1)
root.insert(0)
root.insert(1)
root.printtree()

    
