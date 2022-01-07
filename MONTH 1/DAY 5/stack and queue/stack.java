import java.util.Scanner;

public class stack {
    public static int a[];
    public static int top=0;
    public static int x;
    public static void push(int n){
        a[top]=n;
        top++;
    }
    public static int pop(){
        x=a[top];
        top--;
        return x;
    }

    public static void main(String[] args) {
        Scanner in=new Scanner(System.in);
        a=new int[20];
        int n,n1;
        while(true){
            System.out.println("1 for push::2 for pop:3 for print");
            n=in.nextInt();
            if(n==1){
                System.out.println("enter your element for push");
                n1=in.nextInt();
                push(n1);
            }
            else if (n==2){
                if(top>0){
                    System.out.println(pop()+"this elemet is pop");
                }else{
                    System.out.println("first push the elements");
                }
            }
            else if(n==3){
                for(int i=0;i<top;i++){
                    System.out.println(a[i]);
                }
            }
            else{
                System.out.println("enter the right elements");
            }

        }
    }

}
