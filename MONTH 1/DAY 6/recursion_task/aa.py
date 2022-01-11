import json
f = open('test_data.JSON')
data = json.load(f)
x={}
for i in data:
    if i['entity_id'] not in x:
        x[i['entity_id']]=[i['parent_id']]
    else:
        x[i['entity_id']].append(i['parent_id'])

def findpath(v1):
    if v1=="1":
        return "1"
    if v1=="0":
        return "YOU ARE DONE"
    return findpath(x[v1][0])+"/"+v1
print(findpath(str(input())))



