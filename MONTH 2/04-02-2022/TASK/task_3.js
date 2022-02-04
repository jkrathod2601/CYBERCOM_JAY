const serch_key = (object_x, key_x) => {
    for (i in object_x) {
        if (i == key_x) {
            return true
        }
    }
    return false
}


const run = (event) => {
    event.preventDefault()
    let value_object = JSON.parse(document.getElementById("objectis").value)
    let key = document.getElementById("key").value
    console.log(value_object)
    console.log(key)
    document.getElementById("text").innerHTML = `the key ${key} is in object ${value_object} ?? ${serch_key(value_object,key)}`
}