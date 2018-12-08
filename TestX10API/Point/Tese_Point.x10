package Point;
public class Tese_Point {
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	val origin_1 : Point{rank==1} = Point.make(1);//1
    	val origin_2 : Point{rank==2} = Point.make(0,0);//2.1 2.2
    	val origin_3 : Point = Point.make(new Rail[Long](5,(i:long)=>i+1));//3.1 3.2
    	val p : Point = [1,2,3];//4
    	val q : Point{rank==5} = [1,2,3,4,5];//5
    	val r : Point(3) = [11,22,33];//6
    	Console.OUT.println("1:"+origin_1(0));
    	Console.OUT.println("2.1:"+origin_2(0));
    	Console.OUT.println("2.2:"+origin_2(1));
    	Console.OUT.println("3.1:"+origin_3(0));
    	Console.OUT.println("3.2:"+origin_3(1));
    	Console.OUT.println("4.1:"+p(0));
    	Console.OUT.println("4.2:"+p(1));
    	Console.OUT.println("5:"+q(2));
    	//for(i in q){Console.OUT.println("5:"+q(i));}无法迭代循环输出
    	//for(i in origin_3){Console.OUT.println("5:"+origin_3(i);}
    	Console.OUT.println("6:"+r(2));
    }
}