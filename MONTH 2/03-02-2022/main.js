const fun = (val) => {
    return val * 2
}

let arr = [1, 2, 3]

arr.forEach((val) => {
    console.log(fun(val))
})

const data = ["jayra", "jayraj", "jayp", "jayka"]

// find the first occurance
let ans = data.find(n => {
    return n.includes("jayr")
})
console.log(ans)

//find all occurance
ans = data.filter(n => {
    return n.includes("jayr")
})
console.log(ans)

var a = 5;

if (a = 3) {
    console.log('a', a);
}