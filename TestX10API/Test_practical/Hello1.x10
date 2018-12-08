package Test_practical;

public class Hello1 {
	var v : Rail[Long] = new Rail[Long](4,(i:long)=>i);
	public def this(){
    	
    		Console.OUT.println(here.id+"hahahaha");
    	}
    	public operator this () =
    		"(" + v(0) + "," + v(1) + "," + v(2) + ")";
    	public operator this (n:long) =
    		n+": "+"(" + v(0) + "," + v(1) + "," + v(2) + ")";
    public static def main(args: Rail[String]) {
    	   	
        // TODO auto-generated stub
    	val Hello1=new Hello1();
    	   	Console.OUT.println(Hello1.operator()());
    	   	Console.OUT.println(Hello1.operator()(10));// µœ÷operator this()
    	   	Console.OUT.println(Hello1());
    	   	Console.OUT.println(Hello1(10));
    }
}