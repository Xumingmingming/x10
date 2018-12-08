package Region;
import x10.regionarray.Region;
import x10.regionarray.Array;
public class Test_Region {
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	val R1 = Region.make(1, 100); // Region 1,100
    	val R2 = Region.make(1..100); // Region 1..100
    	val R3=Region.make(1..3)*Region.make(1..2);
    	//val R3=Region.make
    	Console.OUT.println("R1:"+R1);
    	Console.OUT.println("R2:"+R2);
    	for(p in R1){
    		Console.OUT.println(p);
    		}
    	Console.OUT.println("R3:"+R3);//笛卡尔积
    	for(p in R3){
    		Console.OUT.println(p);
    	}
    	val R4=new Array[Long](Region.make(0..9, 0..9), (p:Point(2)) =>p(0)*p(1));
    	
    	Console.OUT.println("R4:"+R4);
    	for(p in R4){
    		Console.OUT.print(p+":");
    		Console.OUT.println(R4(p));
    	}
    	//想取出R1中的第i个数怎么取，如取R4中坐标为（9,9）的Point
    	Console.OUT.println("R4(9,9):"+R4(9,9));
    	val R5=new Array[Long](Region.make(0..9), (p:Point(1)) =>100);
    	Console.OUT.println("R5:");
    	for(p in R5){
    		Console.OUT.print(p+":");
    		Console.OUT.println(R5(p));
    	}
    	Console.OUT.println("R5:"+R5.values());
    	for(p in R5.values()){Console.OUT.println("R5:"+p);}
    }
}