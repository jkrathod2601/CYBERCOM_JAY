// // console.log("start")

// // //blocking statemnet
// // setTimeout(()=>{
// //     console.log("middle is callled")
// // },2000)

// // console.log("end")


//     const runis=()=>{
//         console.log("startis")

//         setTimeout(()=>{
//             console.log("runnig")
//         },3000)

//         console.log("end")
//     }
//     runis()

const run=new Promise((resolve,reject)=>{
    setTimeout(()=>{
        resolve("this is jay")
    },3000)
})

const done=async()=>{
    const data=await run
    console.log(data)
}
done()
