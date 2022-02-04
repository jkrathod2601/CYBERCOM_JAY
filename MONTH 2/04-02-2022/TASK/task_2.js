const printobject = (obj) => {
    let s = ""
    for (let i in obj) {
        s = s + `${i} ==> ${obj[i]} <br><hr>`
    }
    document.getElementById("text").innerHTML = s
}





let person = {

    firstName: "John",

    lastName: "Doe",

    age: 50,

    eyeColor: "blue"

};

printobject(person)