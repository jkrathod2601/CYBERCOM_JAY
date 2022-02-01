const logout = () => {
    localStorage.setItem("adminactive", 0)
    location.replace("login.html")
}

let x = JSON.parse(localStorage.getItem("about"))
let s = `<tr>
        <th>name</th>
        <th>login time</th>
        <th>logout time</th>
    </tr>`
for (let i in x) {
    s = s + `
        <tr>
        <td>${x[i].name}</td>
        <td>${x[i].login_time}</td>
        <td>${x[i].logout_date}</td>
        </tr>
        `
}
document.getElementById("adddata").innerHTML = s