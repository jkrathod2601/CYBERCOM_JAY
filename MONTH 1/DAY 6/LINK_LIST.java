public class HelloWorld {
    public static void main(String[] args) {
       Node n1=new Node(1);
       Node n2=new Node(2);
       Node n3=new Node(3);
       Node n4=new Node(4);
       Node n5=new Node(5);
       
       n1.next=n2;
        n2.next=n3;
         n3.next=n4;
          n4.next=n5;
      System.out.print(n5.count);
    }
}

class Node{
  public int data;
  public Node next;
  public static int count=0;
  public Node(int data){
    count=count+1;
    this.data=data;
  }
  public int countNodes(Node head){
    int countis=1;
    Node current=head;
    while(current.next != null){
      current=current.next;
      count=count+1;
    }
    return count;
  }
}