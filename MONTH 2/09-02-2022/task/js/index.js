const api = "https://reqres.in/api/users";

const addpress = () => {
  location.replace("adddata.html");
};

const adddata = async (event) => {
  event.preventDefault();
  let obj = {
    name: document.getElementById("name").value,
    job: document.getElementById("job").value,
  };
  try {
    const data = await axios.post(api, obj);
    // console.log(data)
    // console.log(data.status)
    if (data.status == 201) {
      alert("data addedd sucsessfully");
      alert(JSON.stringify(data.data));
      location.replace("index.html");
    } else {
      alert("some error are found");
    }
  } catch (error) {
    console.log(error);
  }
};

const get_data = async () => {
  s = ` `;
  const data = await axios.get(api);
  console.log(data.data.data);
  if (data.data.data) {
    for (let i of data.data.data) {
      s =
        s +
        `<tr>
        <td>${i.id}</td>
        <td>${i.email}</td>
        <td>${i.first_name}</td>
        <td>${i.last_name}</td>
        <td><a href=${i.avatar}>${i.avatar}</a></td>
        <td> 
            <button onclick="update('${i.id}')">Update</button>
            <button onclick="deleteid('${i.id}')">delete</button>
        </td>
      </tr>
        `;
    }
    document.getElementById("addhere").innerHTML = s;
  }
};
get_data();



const update=async(id)=>{
    localStorage.setItem("id",id)
    location.replace("update_data.html");
}

const deleteid=async(id)=>{
    const data=await axios.delete(`https://reqres.in/api/users/${id}`)
    if(data.status==204){
        alert("data deletedet successfully")
        get_data()
    }
}