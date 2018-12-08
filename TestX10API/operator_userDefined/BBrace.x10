package operator_userDefined;
public class BBrace extends Trace{
	def this(n:Long) { super(n); }
	public operator -this = new BBrace (10 * this.n + 3);
	static def example() {
		val t = new Trace(1);
		assert (!t).n == 11;
		assert (-t).n == 12 && (-t instanceof Trace);
		val b = new BBrace(1);
		assert (!b).n == 11;
		assert (-b).n == 13 && (-b instanceof BBrace);
	}
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
      BBrace.example();
    }
}