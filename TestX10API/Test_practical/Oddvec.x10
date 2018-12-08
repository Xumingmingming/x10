package Test_practical;

public class Oddvec {
	val i:long;
	val n:long;
	var v : Rail[Long] = new Rail[Long](4,(i:long)=>i);
	public def this(n:long ,i:long){
	  this.n=n;
	  this.i=i;
	  Console.OUT.println(here.id+"hahahaha");
	}
	public operator this () =
		"(" + v(0) + "," + v(1) + "," + v(2) + ")";
}