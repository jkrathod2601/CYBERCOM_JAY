const gameisstart=()=>{
    return new Promise((resolve,reject)=>{
        const number_user=Number(prompt("enter your number and get check your luck"))
        const randome_number=Math.floor(Math.random()*6+1)

        if(NaN==number_user){
            reject("enter a number not a alphanumeric")
        }
        if(number_user===randome_number){
            resolve({
                point:2,
                randomnumber:randome_number
            })
        }
        if(number_user===randome_number-1 || number_user===randome_number+1){
            resolve({
                point:1,
                randomnumber:randome_number
            })
        }else{
            resolve({
                point:0,
                randomnumber:randome_number
            })
        }
    })
}

const start_async=async()=>{
    try{
        const data=await gameisstart()
        alert(`the point is ${data.point} and randomenumber is ${data.randomnumber}`)
    }catch(err){
        alert(err)
    }
}


// const start=()=>{
//     gameisstart().then((val)=>[
//         alert(`the randome number is ${val.randomnumber} and point is ${val.point}`)
//     ]).catch((err)=>{
//         alert("enter a number not alphanumeric")
//     }).finally(()=>{
//         start()
//     })
// }

start()