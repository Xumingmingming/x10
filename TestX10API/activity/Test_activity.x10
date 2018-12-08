package activity;

public class Test_activity {
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	var result : Long = 0;
    	finish {
    		async result = 1;
    	}
    	assert result == 1;
    }
}