let x=[1,2,3]
let y=new Array("jay","rathod","jayraj")

console.log(x)
console.log(y)

console.log(x.length," length of the x")
console.log(y.length," length of y")

x.push(20)
console.log(x)

y.push(30)
console.log(y)

y[10]="yashu"
console.log(y)

// object

const user={
    name:"username",
    password:"password",
    skill:[]
}


const jay=new Object()
jay.name="jay"
jay.password="123jk"
jay.skill=["javascript","node","express"]

console.log(jay)

//define new property of object using inner function
const ex={
    year:2001,
    name:"jay",
    findage:function(){
        console.log("findage is runnig")
        let date=new Date()
        this.age=date.getFullYear()-this.year
    }
}

ex.findage()
console.log(ex)