abstract class abc{
    abstract void run();
    abstract void dun();
    public void runis(){
        System.out.println("this is runis method");
    }
}

class main extends abc{

    @Override
    void run() {
        System.out.println("abstract is runnig");
    }

    @Override
    void dun() {
        System.out.println("abstract is runnig");
    }
}

class run{
    public static void main(String[] args) {
        main m1=new main();
        m1.run();
    }
}