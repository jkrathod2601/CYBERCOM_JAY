

let y1=["jay","rathod","high","road"]
// map
let z=y1.map(((x)=>{
    return x.toUpperCase()
}))
console.log(z)

// foreach
const printfu=(x)=>{
    console.log(x)
}

y1.forEach(printfu) //only define the function name and they not return anything

// filter
// check condition
let a1=[5,10,20,11,49]

let cc1=a1.filter((x)=>{
    return x%5==0
})
console.log(cc1)

// every
// The every() method check if all array values pass a test.
// the some() method for any one value is passing throw the function 
// The find() method returns the value of the first array element that passes a test function.
// The findIndex() method returns the index of the first array element that passes a test function.
const run=(x)=>{
    return x%5==0
}

console.log(a1.every(run))

