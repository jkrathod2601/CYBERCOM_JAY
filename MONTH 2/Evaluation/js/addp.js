// global variable start
const _api="https://fakestoreapi.com/products/categories"
const _api_p="https://fakestoreapi.com/products"
const select_data=document.getElementById("category")
// global variable end

// getting form data and use of post update this data into database with function
const get_form_data=async()=>{  
    event.preventDefault();
    let obj={
        "title":document.getElementById("title").value,
        "price":document.getElementById("price").value,
        "description":document.getElementById("description").value,
        "image":document.getElementById("img_url").value=="" ? "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg":document.getElementById("img_url").value ,
        "category":document.getElementById("category").value
    }
    try {
        const responce=await axios.post(_api_p,obj)
        if(responce.status==200){
            alert("data added successfully")
            location.replace("list_product.html");
        }
    } catch (error) {
        alert("error")
    }
}

// for append category list 
const append_option=(c_data)=>{
    let option=document.createElement("option")
    option.setAttribute("value",c_data)
    option.innerText=c_data
    select_data.appendChild(option)
}

// calling all category list
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
add_cat()

// goto list item page function
const onp=()=>{
    location.replace("list_product.html");
}