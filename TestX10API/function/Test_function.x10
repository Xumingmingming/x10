package function;

public class Test_function {
	
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	val n=3;
    	val f:(x:long){x != n}=>long
    	=(x:long){x != n}=>(12/(n-x));
    	Console.OUT.println("f(4)= "+ f(4));
    	Console.OUT.println("f(5)=" + f(5));
    }
}