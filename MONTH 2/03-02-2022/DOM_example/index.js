// adding element by id
document.getElementById("text_p").innerText = "this is p tag"

// adding element by class
document.querySelector(".h1_class").innerText = "this is h1 tag"

// query selector all
for (let i of document.querySelectorAll(".id_is")) {
    i.innerText = "this is text"
}

// return the element
console.log(document.documentElement)

// object of tag
console.log(document.getElementsByTagName("li"))

//dom styling
document.getElementById("text_p").style.color = "blue";

// use of this keyword in dom
document.querySelector(".h1_class").addEventListener('click', () => {
    console.log("event is called")
    document.getElementById("ulis").appendChild(document.createElement("li"))
})