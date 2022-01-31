const fs=require('fs')
const prompt=require('prompt-sync')

const name=prompt("what is your name")
console.log(name)

const run=async()=>{
    return await fs.readFileSync("new.txt",'utf-8')
}

let x=[1,2,3,5]

console.log(x.forEach(run))