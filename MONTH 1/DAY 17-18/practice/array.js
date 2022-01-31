let x=[1,2,3,4,5,6,7,8,9,10]

console.log(typeof(x))

// also take an refrence
let y1=x

y1.reverse()
// refrence
console.log(x)
console.log(y1)

// spread operator
let z=[...x]

// not taking the refrence
z.reverse()
console.log(z)
console.log(x)

// if we take in then they return the index of the array
for(let i of x){
    console.log(i)
}
console.log("\n")

console.log(x.indexOf(5))

console.log(x[0])

// not supporting - index in javascript
console.log(x[-1])


let y=[1,2,3,4,5]

y.push(20)
console.log(y)
console.log(y.pop())
console.log(y)
y.unshift(40)
console.log(y)
console.log(y.shift())
console.log(y)


// slice and splis
// splice(start)
// splice(start, deleteCount)
// splice(start, deleteCount, item1)
// splice(start, deleteCount, item1, item2, itemN)
let z1=x.slice(2,7)
console.log(z1)

let y11=[1,2,3]
delete y11[2]   //Using delete leaves undefined holes in the array

console.log(y11)


// concatination
let u1=[1,2,3]
let u2=[4,5,6]

let u3=u1.concat(u2)
console.log(u3)

let u4=[...u1,...u2]
console.log(u4)


// sorting
let g1=[5,7,1,3,9]
g1.sort()
console.log(g1)

const fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits.splice(2, 0, "Lemon", "Kiwi");

console.log(fruits)

// deleete the elements
let h1=[1,2,3,4,5,6]
h1.splice(0,3)
console.log(h1)

// array to string
let yy1=h1.toString()
console.log(yy1)

// includes

console.log(fruits.includes("Mango"))  //return true of false


x="216672"
console.log(parseInt(x))

