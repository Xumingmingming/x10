package function;
public class Class_implements implements (boolean)=>long,(Long, Long)=> Long{
	public operator this(Boolean) = 1;
	public operator this(x:Long, y:Long) = 10*x+y;
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	val f:Class_implements = new Class_implements();
    	assert f(true) == 1; // (Boolean)=>Long behavior
    	assert f(1,2) == 12; // (Long,Long)=>Long behavior
    }
}