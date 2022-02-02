let date=new Date()
document.getElementById("birthdate").max=`${date.getFullYear()-18}-0${date.getUTCMonth()}-0${date.getDate()}`
const logout=()=>{
    localStorage.setItem("adminactive",0)
    location.replace("login.html")
}
const adddata=()=>{
    event.preventDefault()
    let name=document.getElementById("name").value
    let email=document.getElementById("email").value
    let password=document.getElementById("password").value
    let birthdate=document.getElementById("birthdate").value
    let y1=JSON.parse(localStorage.getItem("user"))
    let checkemail=true
    for (let i in y1){
        if (email==i){
            checkemail=false
        }
    }
    if(checkemail==true){
        y1[email]={
        name:name,
        email:email,
        password:password,
        birthdate:birthdate,
    }
    localStorage.setItem("user",JSON.stringify(y1))
    location.replace("user.html")
    }else{
        alert("email is allready taken in databse")
    }
   
}
const update=(email)=>{
    let y1=JSON.parse(localStorage.getItem("user"))
    document.getElementById("name").value=y1[email].name
    document.getElementById("email").value=y1[email].email
    document.getElementById("password").value=y1[email].password
    document.getElementById("birthdate").value=y1[email].birthdate
    document.getElementById("text").innerText="update data"
    delete y1[email]
    localStorage.setItem("user",JSON.stringify(y1))
}
const deletei=(email)=>{
    event.preventDefault()
    let y1=JSON.parse(localStorage.getItem("user"))
    delete y1[email]
    console.log(y1)
    localStorage.setItem("user",JSON.stringify(y1))
    location.replace("user.html")
}
const settable=()=>{
    let y1=JSON.parse(localStorage.getItem("user"))
    let s=`<tr>
        <th>name</th>
         <th>email</th>
        <th>password</th>
        <th>birthdate</th>
        <th>age</th>
        <th>actions</th>
    </tr>`
    for(let i in y1){
        let dateisa=y1[i].birthdate
        let dateisaa=parseInt(dateisa.slice(0,5))
        s=s+`
        <tr>
            <td>${y1[i].name}</td>
            <td><a href="">${i}</a></td>
            <td>${y1[i].password}</td>
            <td>${y1[i].birthdate}</td>
            <td>${date.getFullYear()-dateisaa}</td>
            <td>
                <button class="btn" onclick="update('${i}')">edit User</button>
                <button class="btn" onclick="deletei('${i}')">delete User</button>
            </td>
        </tr>
        `
    }
    document.getElementById("addtable").innerHTML=s
}

settable();