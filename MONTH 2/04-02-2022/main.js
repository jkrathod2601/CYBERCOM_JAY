const run = new Promise((resolve, reject) => {
    let x = "jayraj"
    if (x == "jayraj") {
        resolve("yes your name is same")
    } else {
        reject("no your name is not same")
    }
})

run.then((x) => {
    console.log(x)
})


const apicall = new Promise((r, e) => {
    setTimeout(() => {
        r("yes your data added succesfully")
    }, 5000)
})

apicall.then((val) => {
    console.log(val)
})