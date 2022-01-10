c=0
def frog(start,end):
    if start==end:
        return 1
    if start>end:
        return 0
    for i in range(2):
        return frog(start+1,end)+frog(start+2,end)

print(frog(1,6))
# 1 2 3 4 


# def frog(start,end):
#     c=0
#     if start == end:
#         return 0
#     if end-start>=2:
#         c=2
#         return c+frog(start+1,end)+frog(start+2,end)
#     if end-start==1:
#         c=1
#         return c+frog(start+1,end)


# print(frog(1,4))


