package redefine;

public class Refine_if {
	val num:long;
	public def this(num:long){
		this.num=num;
	}
	public operator if(then: ()=>void, else_: ()=>void) {
		if (num==1) {
			then();
			Console.OUT.println("if in true");
		} else {
			else_();
			Console.OUT.println("if in false");
		}
	}
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	val refine_if=new Refine_if(1);
    	val refine_if2=new Refine_if(2);
    	refine_if.if(){
    		Console.OUT.println("true");
    	}
    	else{Console.OUT.println("false");}
     refine_if2.if(){
    	Console.OUT.println("true");
    }
    else{Console.OUT.println("false");}
     }
    }