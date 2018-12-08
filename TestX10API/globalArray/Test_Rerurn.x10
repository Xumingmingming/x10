package globalArray;

public class Test_Rerurn {
	val size:long;
	def this(size:long){
		this.size=size;
	}
	public static def make(size:Long){
		//val globalarray=new GlobalArray();
			val globalArray=new Test_Rerurn(size);
			Console.OUT.println("globalArray="+globalArray);
			return globalArray;  
	}
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	val a=Test_Rerurn.make(3); 
    	//Console.OUT.println("Test_Rerurn.make(3)="+Test_Rerurn.make(3));
    	Console.OUT.println("a="+a);
    	Console.OUT.println(a.size);
    }
}