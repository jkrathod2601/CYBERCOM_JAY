const data={
    name:"jay rathod",
    age:20,
    about:{
        address:"near patel factory"
    }
}
console.log(typeof(data.about.address))


function fun1(name,age,address){
    this.name=name
    this.age=age
    this.address=address
}

const jay=new fun1("jay",20,"near patel factory")
console.log(jay.name)


const a1={
    name:"jay rathod",
    run:()=>{
        console.log("run is running")
    }
}

a1.run()

const a2={...a1}
a2.name="rathod"
console.log(a2.name)

const users = {
    Alex: {
      email: 'alex@alex.com',
      skills: ['HTML', 'CSS', 'JavaScript'],
      age: 20,
      isLoggedIn: false,
      points: 30
    },
    Asab: {
      email: 'asab@asab.com',
      skills: ['HTML', 'CSS', 'JavaScript', 'Redux', 'MongoDB', 'Express', 'React', 'Node'],
      age: 25,
      isLoggedIn: false,
      points: 50
    },
    Brook: {
      email: 'daniel@daniel.com',
      skills: ['HTML', 'CSS', 'JavaScript', 'React', 'Redux'],
      age: 30,
      isLoggedIn: true,
      points: 50
    },
    Daniel: {
      email: 'daniel@alex.com',
      skills: ['HTML', 'CSS', 'JavaScript', 'Python'],
      age: 20,
      isLoggedIn: false,
      points: 40
    },
    John: {
      email: 'john@john.com',
      skills: ['HTML', 'CSS', 'JavaScript', 'React', 'Redux', 'Node.js'],
      age: 20,
      isLoggedIn: true,
      points: 50
    },
    Thomas: {
      email: 'thomas@thomas.com',
      skills: ['HTML', 'CSS', 'JavaScript', 'React'],
      age: 20,
      isLoggedIn: false,
      points: 40
    },
    Paul: {
      email: 'paul@paul.com',
      skills: ['HTML', 'CSS', 'JavaScript', 'MongoDB', 'Express', 'React', 'Node'],
      age: 20,
      isLoggedIn: false,
      points: 40
    }
  }

//   in object itteration always use in 
//   for(let i in users){
//       if(users[i].skills.length && users[i].points<50){
//           console.log(users[i].email)
//       }
//   }

  for(let i in users){
      if(users[i].skills.includes('MongoDB', 'Express', 'React', 'Node')){
          console.log(users[i].email)
      }
  }


  const aboutme={
    name:"jay",
    age:20,
    address:"near patel factory",
    addressis: function(){
      return this.name+"  "+this.age+"   "+this.address
    }
  }

  console.log(aboutme.addressis())

  const person = {
    firstName: "John",
    lastName : "Doe",
    id       : 5566,
    fullName : function() {
      return this.firstName + " " + this.lastName;
    }
  };

  console.log(person.fullName())
delete person.fullName
console.log(person)

// console.log(person.includes("firstName"))

const date=new Date()
console.log(date)

const x=[]

const y={
  name:jay,
  age:20
}

console.log(x.push(jay))
console.log(x)


const data11={}

data11["a"]=y
console.log(data11)

console.log(localStorage.getItem("love"))