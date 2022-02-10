// global variable start
const _api_get="https://fakestoreapi.com/products/"
const _api="https://fakestoreapi.com/products/categories"
const select_data=document.getElementById("category")
// global variable end

// append select option data into it
const append_option=(c_data)=>{
    let option=document.createElement("option")
    option.setAttribute("value",c_data)
    option.innerText=c_data
    select_data.appendChild(option)
}

// get all categories
const add_cat=async()=>{
    try {
        const category_data=await axios.get(_api)
        if(category_data.data){
            category_data.data.forEach(append_option)
        }
    } catch (error) {
        console.log(error)
    }
}


// insert from data with selected product id
const insert_field=async()=>{
    try {
        if(sessionStorage.getItem("id")){
            const responce=await axios.get(_api_get+`${sessionStorage.getItem("id")}`)
            if(responce.data){
                console.log(responce.data)
                document.getElementById("title").value=responce.data.title
                document.getElementById("price").value=responce.data.price
                document.getElementById("description").value=responce.data.description
                document.getElementById("img_url").value=responce.data.image
                await add_cat()
                document.getElementById("category").value=responce.data.category
            }
        }
    } catch (error) {
        alert(error)
    }
}
insert_field()


// update form data with put request
const update_form_data=async()=>{
    event.preventDefault()
    document.getElementById("btn").setAttribute("hidden",true)
    let obj={
        "title":document.getElementById("title").value,
        "price":document.getElementById("price").value,
        "description":document.getElementById("description").value,
        "image":document.getElementById("img_url").value=="" ? "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg":document.getElementById("img_url").value ,
        "category":document.getElementById("category").value
    }
    try {
        const responce=await axios.put(_api_get+`${sessionStorage.getItem("id")}`,obj)
        if(responce.status==200){
            alert("data added successfully")
            sessionStorage.clear()
            location.replace("list_product.html")
        }
    } catch (error) {
        alert(error)
        sessionStorage.clear()
        location.replace("list_product.html")
    }
}