let x=localStorage.getItem("adminisadd")
          if(x=="1"){
            document.getElementById("rege").innerHTML="";
          }
          const check=(event)=>{
              event.preventDefault()
              let b=false
              let x2=JSON.parse(localStorage.getItem("admin"))
              if (x2==null){
                alert("add first admin and then admin add user then you login")
                location.replace("login.html")
              }
              let x4=JSON.parse(localStorage.getItem("user"))
              let name=x2.email
              let password=x2.password
              let namex=document.getElementById("name").value
              let passwordx=document.getElementById("password").value
              
              if(name==namex && password==passwordx){
                location.replace("dashboard.html")
                localStorage.setItem("adminactive","1")
              }
              else{
                for(let i in x4){
                    if(x4[i].email==namex && x4[i].password==passwordx){
                        b=true
                        sessionStorage.setItem("activeuser",namex)
                        let ab=localStorage.getItem("about")
                        let bc=JSON.parse(ab)
                        console.log(bc)
                        let date=new Date()
                        let id=localStorage.getItem("id")
                        localStorage.setItem("id", JSON.stringify(parseInt(id) + 1))
                        let dateobject={
                          name:namex,
                          login_time:date,
                          logout_date:""
                        }
                        bc[parseInt(id)+1]=dateobject
                        let dc=JSON.stringify(bc)
                        localStorage.setItem("about",dc)
                        location.replace("userdash.html")
                    }
                }
                if(b==false){
                    alert("check your password")
                }
              }
              
          }