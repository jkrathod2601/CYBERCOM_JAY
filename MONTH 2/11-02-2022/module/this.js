const obj={
    id:[1,2,3,4],
    run(){
        console.log(this.id)
    },
    idis(){
        console.log("raj is")
    }
}

obj.run()

class run{
    constructor(){
        this.x=5
        this.name="jay ratod"
    }

    runis(){
        console.log(this.name)
    }
}

const add=new run()
add.runis()


const done=()=>{
    console.log(this)
}
done()