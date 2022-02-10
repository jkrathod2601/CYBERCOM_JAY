// global variable start
const _api_cate = "https://fakestoreapi.com/products/categories";
const _api_by_cate_product = "https://fakestoreapi.com/products/category/";
const put_data = document.getElementById("t_1");
const _adddatatable = document.getElementById("table_data_add");
// global variable end

// append child for category's vice table
const create_table_cate = (obj) => {
  let tr = document.createElement("tr");
  let td1 = document.createElement("td");
  td1.innerText = obj;
  let td2 = document.createElement("td");
  let btn = document.createElement("button");
  btn.setAttribute("onclick", `view_cate("${obj}")`);
  btn.setAttribute("class", "btn btn-primary");
  btn.innerText = "View Data";
  td2.appendChild(btn);
  tr.appendChild(td1);
  tr.appendChild(td2);
  put_data.appendChild(tr);
};

// getting data from category and send into html creating function
const show_cate_table = async () => {
  try {
    const responce = await axios.get(_api_cate);
    if (responce.data) {
      responce.data.forEach(create_table_cate);
    }
  } catch (error) {}
};
show_cate_table();

// append data for selected category
const append_child = (obj) => {
  let tr = document.createElement("tr");
  let td1 = document.createElement("td");
  let img = document.createElement("img");
  img.setAttribute("src", `${obj.image}`);
  img.setAttribute("id", "img_p");
  td1.appendChild(img);
  let td2 = document.createElement("td");
  td2.innerText = obj.title;
  let td3 = document.createElement("td");
  td3.innerText = obj.category;
  let td4 = document.createElement("td");
  td4.innerText = obj.price;
  tr.appendChild(td1);
  tr.appendChild(td2);
  tr.appendChild(td3);
  tr.appendChild(td4);
  _adddatatable.appendChild(tr);
};

// getting data for selecting category and displaying it
const view_cate = async (id) => {
  document.getElementById("cname").innerText = id;
  try {
    const responce = await axios.get(_api_by_cate_product + `${id}`);
    if (responce.data) {
      _adddatatable.innerHTML = "";
      _adddatatable.innerText = "waiting for data";
      document.getElementById("citem").innerText = responce.data.length;
      responce.data.forEach(append_child);
    } else {
      alert("error found");
    }
  } catch (error) {
    alert(error);
  }
};

// go to all list page
const onp = () => {
  location.replace("list_product.html");
};
