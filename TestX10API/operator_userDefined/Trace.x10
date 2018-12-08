package operator_userDefined;
public class Trace(n:Long){
	public static operator !(f:Trace)
	= new Trace(10 * f.n + 1);
	public operator -this = new Trace (10 * this.n + 2);
}

 