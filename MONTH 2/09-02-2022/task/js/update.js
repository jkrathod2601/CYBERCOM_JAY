const data_update=async(id)=>{
    console.log(id)
    try {
        const data=await axios.get(`https://reqres.in/api/users/${id}`)
    console.log(data.data.data)
    document.getElementById("first_name").value=data.data.data.first_name
    document.getElementById("last_name").value=data.data.data.last_name
    document.getElementById("email").value=data.data.data.email
    document.getElementById("avatar").value=data.data.data.avatar
    } catch (error) {
        alert(error)
    }
    
}

const update_data=()=>{
    console.log(localStorage.getItem("id"))
    data_update(localStorage.getItem("id"))
}
update_data()

const update_data_is=async()=>{
    // event.preventDefault()
    let obj={
        first_name:document.getElementById("first_name").value,
        last_name:document.getElementById("last_name").value,
        email:document.getElementById("email").value,
        avatar:document.getElementById("avatar").value,
        id:localStorage.getItem("id")
    }
    try {
        const data=await axios.put(`https://reqres.in/api/users/${localStorage.getItem("id")}`)
    if(data.status==200){
        alert(JSON.stringify(data.data))
        location.replace("index.html");
    }else{
        alert("not updated")
    }
    } catch (error) {
        alert(error)
    }
    
}
