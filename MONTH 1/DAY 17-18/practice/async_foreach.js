let a=[1,2,3,4,5,6]


// not supported
const add=(x)=>{
    setTimeout(()=>{
        return x+2
    },1000)
}

let l=[]
// a.forEach(async (value)=>{
//     l.push(await add(value))
// })

// console.log(l)

const ff=async ()=>{
    for(let i of a){
        console.log(await add(i))
        l.push(await add(i))
    }
    console.log(l)
}
ff()



// foreach not supoorted a async_await but for supported it

