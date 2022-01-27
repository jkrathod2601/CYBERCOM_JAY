class tree:
    # define  a node
    def __init__(self, data):
        #this is the class object of sum
        self.sum=0
        self.data = data
        self.left= None
        self.right= None
    def sumofleftleaf(self,root):
        #first we checking the root is none
        if root is not None:
            #checking the left node of this perent node is available
            if root.left is not None:
                # checking this is not last node
                if root.left.left is None and root.left.right is None:
                    #if there is a last node then add it into the sum
                    self.sum+=root.left.data
            # calling left childe of root
            self.sumofleftleaf(root.left)
            # calling right child of root
            self.sumofleftleaf(root.right)

#[3,9,20,null,null,15,7]                                                                               
sumis=0
root=tree(3)
root.left=tree(9)
root.left.left=None
root.left.right=None
root.right=tree(20)
root.right.left=tree(15)
#root.right.left.left=tree(20)
root.right.right=tree(7)
#root.right.right.left=tree(100)
root.sumofleftleaf(root)
print(root.sum)
