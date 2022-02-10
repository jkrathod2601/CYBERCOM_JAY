sessionStorage.clear()
// global variable start
const _api="https://fakestoreapi.com/products"
const _api_sort="https://fakestoreapi.com/products?sort=desc"
const _adddatatable=document.getElementById("table_data_add")
// global variable end


// list item append function in html table
const append_child=(obj)=>{
    let tr=document.createElement("tr");
    let td1=document.createElement("td");
    let img=document.createElement("img");
    img.setAttribute("src",`${obj.image}`)
    img.setAttribute("id","img_p")
    td1.appendChild(img)
    let td2=document.createElement("td");
    td2.innerText=obj.title
    let td3=document.createElement("td");
    td3.innerText=obj.category
    let td4=document.createElement("td");
    td4.innerText=obj.price
    let td5=document.createElement("td");
    let btn1=document.createElement("button");
    btn1.setAttribute("class","btn btn-primary")
    btn1.setAttribute("onclick",`update("${obj.id}")`)
    let btn2=document.createElement("button");
    btn2.setAttribute("class","btn btn-danger")
    btn2.setAttribute("onclick",`deleteid(${obj.id})`)
    btn1.innerText="Update"
    btn2.innerText="Detele"
    td5.appendChild(btn1)
    td5.appendChild(btn2)
    tr.appendChild(td1)
    tr.appendChild(td2)
    tr.appendChild(td3)
    tr.appendChild(td4)
    tr.appendChild(td5)
    _adddatatable.appendChild(tr)
}


// list data api calling 
// using get method
const getdata=async()=>{
    try {
        const data=await axios.get(_api)
        if(data.data){
            data.data.forEach(append_child)
        }else{
            alert("No found data")
        }
    } catch (error) {
        alert(error)
    }
}
getdata()

// goto add product page
const go_to_add=()=>{
    location.replace("add.html");
}
// goto category page
const go_to_cate=()=>{
    location.replace("cate.html");
}

// delete by id function and delete api call
const deleteid=async(id)=>{
    try {
       let confirm_value=confirm("are you sure to delete this product?")
       if(confirm_value){
           const responce=await axios.delete(_api+`/${id}`)
           if(responce.status==200){
               alert("data deleted successfully")
               getdata()
           }else{
               alert("facing some error")
           }
       }else{
           alert("you are not deleteing product now")
       }
    } catch (error) {
        alert(error)
    }
}

// this is go into update page with parameter
const update=(id)=>{
    sessionStorage.setItem("id",id)
    location.replace("updatep.html")
}

// sort item by category
const sortp=async()=>{
    try {
        const data=await axios.get(_api_sort)
        if(data.data){
            _adddatatable.innerHTML=""
            data.data.forEach(append_child)
            alert("your data sorted")
        }else{
            alert("Not able to sort data")
        }
    } catch (error) {
        alert(error)
    }
    
}