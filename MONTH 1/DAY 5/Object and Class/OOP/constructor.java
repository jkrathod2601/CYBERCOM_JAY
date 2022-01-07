public class Constructor {
    public static void main(String[] args) {
        C1 c=new C1();
        C2 cc=new C2(5);
    }
}

//defualt constructor
//define constructor
class C1{
    public C1(){
        System.out.println("constructor is calling");
    }
}

class C2{
    public C2(int n){
        System.out.println("constructor is calling and vlaue is "+n);
    }
}
