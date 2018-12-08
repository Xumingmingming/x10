package operator_userDefined;

public class Test_Trace {
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	val trace=new Trace(1);
    	Console.OUT.println("!trace="+!trace);
    	Console.OUT.println("-trace="+-trace);
    	Console.OUT.println("(!trace).n="+(!trace).n);
    	Console.OUT.println("(-trace).n="+(-trace).n);
    	val bbrace=new BBrace(1);
    	Console.OUT.println("!bbrace="+!bbrace);
    	Console.OUT.println("-bbrace="+-bbrace);
    	Console.OUT.println("(!bbrace).n="+(!bbrace).n);
    	Console.OUT.println("(-bbrace).n="+(-bbrace).n);
    	val bbrace1=new BBrace(2);
    	Console.OUT.println("!bbrace1="+!bbrace1);
    	Console.OUT.println("-bbrace1="+-bbrace1);
    	Console.OUT.println("(!bbrace1).n="+(!bbrace1).n);
    	Console.OUT.println("(-bbrace1).n="+(-bbrace1).n);
    }
}