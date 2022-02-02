// simple function and function calling
function fun() {
    console.log("fun function is calling")
}
fun()

// parameter passing throw function
function run(x, y) {
    console.log(x, y)
}
run(10, 20)

//simple arrow function
const runis = () => {
        console.log("this is runis")
    }
    // parameter passing throw function
const funis = (x, y) => {
    console.log(x, y)
}
runis()
funis("jay", "rathod")

// return value in function

const done = () => {
    return "this is done"
}

console.log(done())


console.log(typeof([1, 2, 3]))

// multiple value with spred operator
const doneis = (x, y, z) => {
    console.log(x, y, z)
}

// doneis(...[1, 2, 3, 4])

// multiple parameter 
// const runisdone = (...x) => {
//     console.log(x)
// }

// runisdone(1, 2, 3, 4) //outpur [1,2,3,4]

// // self invoke function
// (function(n) {
//     console.log(n * n * n)
// })(10)

// Function with default parameters
const run1 = (x = 5) => {
    console.log(x)
}
run1()
run1(10)