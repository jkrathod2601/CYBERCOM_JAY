function logout() {
    const date = new Date()
    let id = localStorage.getItem("id")
    let data = localStorage.getItem("about")
    let realdata = JSON.parse(data)
        // console.log(realdata[1])
    realdata[id].logout_date = date
    localStorage.setItem("about", JSON.stringify(realdata))
        // localStorage.setItem("id", JSON.stringify(id + 1))
    location.replace("login.html")
    sessionStorage.setItem("activeuser", "")
}

document.getElementById("text").innerText = sessionStorage.getItem("activeuser")
let x = localStorage.getItem("user")
let y = JSON.parse(x)
let year = y[sessionStorage.getItem("activeuser")].birthdate
let date = new Date()
let month = date.getMonth() + 1
let day = date.getDay()
let monthis = parseInt(year.slice(5, 7))
console.log(month, monthis)
let dayis = parseInt(year.slice(9, 11)) + 1
console.log(day, dayis)
if (month == monthis && dayis == day) {
    document.getElementById("bw").innerHTML =
        `<img src="https://thumbs.dreamstime.com/b/happy-birthday-cupcake-celebration-message-160558421.jpg" alt="">`
}