def part(array, left, right):
  pivot = array[right]
  i = left - 1
  for j in range(left, right):
    if array[j] <= pivot:
      i = i + 1
      array[i], array[j] = array[j], array[i]
  array[i + 1], array[right] = array[right], array[i + 1]
  return i + 1
def quick(array, left, right):
  if left < right:
    pi = part(array, left, right)
    quick(array, left, pi - 1)
    quick(array, pi + 1, right)

data = []
n=int(input("enter length of array"))
for i in range(0,n):
    data.append(int(input()))
quick(data, 0, len(data) - 1)
print(data)

