l=[]

while 1:
  print("1 for push::2 for pop::3 for print")
  i=int(input())
  if i==1:
    l.append(int(input("push into stack")))
  elif i==2:
    if len(l)>0:
        print(l.pop())
        print("this element is poped from stack")
    else:
        print("your stack is empty first push and then remove")
  elif i==3:
    print(l)
  else:
    print("enter valid number")
