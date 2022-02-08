const barear = {
    headers: {
      Authorization: "Bearer " + "9a5b2f8725864a0624dcb19087a9f82b3b752ab43df7cfc3d76f0673628384dc"
    },
  };

    const getdata=async()=>{
        let s=""
        const get_data=await axios.get("https://gorest.co.in/public/v2/users",barear)
        console.log(get_data.data)
        if(get_data && get_data.data){
            for(let i of get_data.data){
                s=s+`<div id="sub">
                    <h3>${i.id}</h3>
                    <h4>${i.email}</h4>
                    <h3>${i.name}</h3>
                    </div>`
            }
            document.getElementById("main").innerHTML=s
        }
    }
    getdata()


    const delete_data=async(id)=>{
        event.preventDefault()
        try{
            const delete_data_is=await axios.delete(`https://gorest.co.in/public/v2/users/${id}`,barear)
            if(delete_data_is.status==204){
                alert("data delete sucsessfully")
                document.getElementById("deid").value=""
                getdata()
            }
        }catch(err){
            alert(err)
        }
        
    }
    // delete_data()

    const add_data=async(obj)=>{
        event.preventDefault()
        try{
            const add_data_is=await axios.post("https://gorest.co.in/public/v2/users",obj,barear)
            console.log(add_data_is)
            if(add_data_is.status==201){
                alert("data added SUCCESSFULLY")
                getdata()
                document.getElementById("id").value=""
                document.getElementById("name").value=""
                document.getElementById("email").value=""
                document.getElementById("gender").value=""
            }
        }catch(err){
            alert(err)
        }
        
    }
    // add_data()

    const update_data=async(obj,id)=>{
        event.preventDefault()
        try {
            const update_data_is=await axios.put(`https://gorest.co.in/public/v2/users/${id}`,obj,barear)
            console.log(update_data_is)
        if(update_data_is.status==200){
            alert("data update successfully")
            document.getElementById("uuid").value=""
            document.getElementById("uuname").value=""
            document.getElementById("uuemail").value=""
            document.getElementById("uugender").value=""
            getdata()
        }
        } catch (error) {
            alert(error)
        }
        
    }
    // update_data()

    const run=(event)=>{
        event.preventDefault()
        let obj={
            id:document.getElementById("id").value,
            name:document.getElementById("name").value,
            email:document.getElementById("email").value,
            gender:document.getElementById("gender").value,
            status:"active"
        }
        console.log(obj)
        add_data(obj)
    }

    const delete_id=(event)=>{
        event.preventDefault()
        let id=document.getElementById("deid").value
        console.log(id)
        delete_data(id)
    }

    const updateid=async(event)=>{
        event.preventDefault()
        let uid=document.getElementById("uid").value
        console.log(uid)
        const data_get_uid=await axios.get(`https://gorest.co.in/public/v2/users/${uid}`,barear)
        console.log(data_get_uid.data)
        document.getElementById("uuid").value=data_get_uid.data.id
        document.getElementById("uuemail").value=data_get_uid.data.email
        document.getElementById("uuname").value=data_get_uid.data.name
        document.getElementById("uugender").value=data_get_uid.data.gender
    }

    const uurun=(event)=>{
        event.preventDefault()
        let obj={
            id:document.getElementById("uuid").value,
            name:document.getElementById("uuname").value,
            email: document.getElementById("uuemail").value,
            status:"active",
            gender: document.getElementById("uugender").value
        }
        update_data(obj,document.getElementById("uuid").value)
    }