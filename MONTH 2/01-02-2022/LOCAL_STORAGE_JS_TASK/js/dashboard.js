 
        const logout=()=>{
            localStorage.setItem("adminactive",0)
            location.replace("login.html")
        }
        let c1=0
        let c2=0
        let c3=0
        let date=new Date().getFullYear()
        let y2=JSON.parse(localStorage.getItem("user"))
        for (let j in y2){
            let x=parseInt(y2[j].birthdate.slice(0,5))
            if(date-x<18){
                c1=c1+1
            }
            if(date-x>18 && date-x<50){
                c2=c2+1
            }
            if(date-x>50){
                c3=c3+1
            }
        }
        document.getElementById("one").innerText=c1
        document.getElementById("two").innerText=c2
        document.getElementById("three").innerText=c3