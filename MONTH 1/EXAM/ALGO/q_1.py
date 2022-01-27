# define the structure of node
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None
 
# create a class of linklist saparate
class link:
    def __init__(self):
        self.head = None
        self.last = None
 
    def add(self, data):
        # for adding the first node (head node)
        if self.last is None:
            self.head = Node(data)
            self.last = self.head
        # other then head node is add by this
        else:
            self.last.next = Node(data)
            self.last = self.last.next
 
    def printlinklist(self):
        # start with the head node
        current = self.head
        while current is not None:
            print(current.data)
            current=current.next
    
    def reversethelinklist(self,l):
        # define the pre is null
        pre = None
        current = l.head
        if current is None:
            return
        # save the result of next node
        post = current.next
        while post:
            current.next = pre
            pre = current
            current = post
            post = post.next
        current.next = pre
        l.head = current
 
# crating the object of class link
a = link()

#  get data for the list
input_a = int(input("enter the number of linklist\n"))
for data in range(input_a):
    a.add(int(input("enter the number\n")))
print("link list befor the reverse")
# print the linklist
a.printlinklist()
print("\n")
# calling the reverse list function
a.reversethelinklist(a)
print("link list post the reverse")
# print the linklist
a.printlinklist()