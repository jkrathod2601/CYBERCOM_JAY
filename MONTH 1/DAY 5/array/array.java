import java.util.Scanner;

public class Array {
    //passing array to the method
    public  static  int x=5;
    public  static  void min(int a[]){
        int min=a[0];
        for(int i=0;i<a.length;i++){
            if(a[i]<min){
                min=a[i];
            }
        }
        System.out.println(min);
    }

    public static void main(String[] args) {
        int a[]=new int[5];//post define
        int b[]={11,22,33,44,55};//predifine
        Scanner in=new Scanner(System.in);
        for(int i=0;i<5;i++){
            a[i]=in.nextInt();
        }
        for(int j=0;j<5;j++){
            System.out.println(a[j]);
            System.out.println(b[j]);
        }
        min(a);
        min(b);
        min(new int[]{2,3,4,5});//anonymous array

        //multi dimensional array
        int a1[][]=new int[2][2];
        a1[0][0]=1;
        a1[0][1]=2;
        a1[1][0]=3;
        a1[1][1]=4;
        for(int k1=0;k1<2;k1++){
            for(int k2=0;k2<2;k2++){
                System.out.println(a1[k1][k2]);
            }
        }
        System.out.println(x+" this is static value");
        int b1[]=new int[5];
        //copy array
        //clone means the copy refrence
        System.arraycopy(a,1,b1,0,4);
        for(int i=0;i<5;i++){
            System.out.println(b1[i]);
        }
        //character array
        char c[]={'j','y','r'};
        for(int i=0;i<3;i++){
            System.out.println(c[i]);
        }

    }
}
