const checkcake=(condition)=>{
    return new Promise((resolve,reject)=>{
        setTimeout(()=>{
            if(!condition){
                resolve(10)
            }else{
                reject(0)
            }
        },3000)
    })
}

//then for resolve
//catch for reject
//finally allways run
checkcake(false).then((val)=>{
    console.log(`they have ${val} Cake`)
}).catch((err)=>{
    console.log(`they have ${err} cake`)
}).finally(()=>{
    console.log("party to deni padengi")
})