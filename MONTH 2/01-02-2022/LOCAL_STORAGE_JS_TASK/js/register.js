const check=()=>{
    event.preventDefault()
    let y=document.getElementById("password").value
    let y1=document.getElementById("cpassword").value
      if(y1==y){
        let name=document.getElementById("name").value
          let email=document.getElementById("email").value
          let state=document.getElementById("state").value
          let city=document.getElementById("city").value
          console.log(password)
          const admindata={
              name:name,
              email:email,
              password:y1,
              city:city,
              state:state
          }
          localStorage.setItem("admin",JSON.stringify(admindata))
          localStorage.setItem("adminisadd",1)
          localStorage.setItem("id",1)
          localStorage.setItem("about",JSON.stringify({}))
          localStorage.setItem("user",JSON.stringify({}))
          sessionStorage.setItem("activeuser","")
          location.replace("login.html")

      }else{
          alert("enter same password in input")
      }
  }