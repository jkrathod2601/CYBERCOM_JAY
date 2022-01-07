public class Super {
    public int n1,n2;
    public Super(int n1,int n2){
        this.n1=n1;
        this.n2=n2;
    }

    public void run(){
        System.out.println("this is n1 "+this.n1+"this is n2 "+this.n2);
    }
}

class Child extends Super{
    public Child(int n1, int n2) {
        super(n1, n2);
    }

    //run time polymorphism // method oveerriding
    public void run(){
        System.out.println(super.n1);
        System.out.println("child class run is calling");
    }
    public void runagain(){
        System.out.println("child class is calling");
    }
}

class Main{
    static int x=3;
    static void runis(){
        System.out.println("static method is calling");
    }
    public static void main(String[] args) {
        Child c1=new Child(10,20);
        c1.runagain();
        c1.run();
        System.out.println(x);
        runis();
    }
}
