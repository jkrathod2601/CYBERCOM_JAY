class data:
    x=[0,0,0,0,0,0,0,0,0,0]
    top=0
    down=0
    def enqueue(self,data):
        if self.top<len(self.x):
            self.x[self.top]=data
            self.top=self.top+1
        else:
            print("your queue is full")
    def dequeue(self):
        if self.down>=0 and self.down!=self.top:
            print(self.x[self.down])
            self.x[self.down]=0
            self.down=self.down+1
        else:
            print("queue is empty")
    def printqueue(self):
        for i in range(self.down,self.top):
            print(self.x[i],end=" ")
d1=data()
while True:
    print("1:enqueue 2:dequeue 3:print")
    n=int(input())
    if n==1:
        d1.enqueue(int(input("enter data for enqueue")))
    if n==2:
        d1.dequeue()
    if n==3:
        d1.printqueue()

