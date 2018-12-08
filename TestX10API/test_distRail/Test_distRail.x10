package test_distRail;

public class Test_distRail {
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	val disRail= new DistRail(10);
    	for(i in 0..9){disRail(i)=i+1;}
    	for(i in 0..9) {Console.OUT.println(disRail(i));}
    }
    }
