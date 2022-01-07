public class Test {
    public static void main(String [] args){
        System.out.println("this is jay rathod");
        Person p1=new Person(20,2022,"jay rathod");
        p1.getinfo();
        Person p2=new Person(21,2023,"kripc saravaiya");
        p1.getinfo();   
        Men m1=new Men(22,23,"jay");
        m1.run();
        m1.ownd=p2;
        m1.ownd.getinfo();
    }
}

class Person{
    public int age;
    public String name;
    public int year;
    public  Person(int age,int year,String name){
        this.name=name;
        this.age=age;
        this.year=year;
    }

    public void getinfo(){
        System.out.println(" the name of the person is "+this.name+" the age of person is "+this.age+" the year is "+this.year);
    }
}

class Men{
    public String s1;
    public int n1;
    public int n2;
    Person ownd;
    public Men(int n1,int n2,String s1){
        this.n1=n1;
        this.n2=n2;
        this.s1=s1;
    }
    public void run(){
        System.out.println(this.s1+" men is running");
    }

}
