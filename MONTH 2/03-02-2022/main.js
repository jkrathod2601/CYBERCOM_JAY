const fun = (val) => {
    return val * 2
}

let arr = [1, 2, 3]

arr.forEach((val) => {
    console.log(fun(val))
})