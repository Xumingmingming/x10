package clock;

public class ClockTest2 {
	static def say(s:String) {
		Console.OUT.println(s);   //deadlock test.
	}
	public static def main2(argv:Rail[String])
	{
		val c1=Clock.make();
		val c2=Clock.make();
		
	//	c.resume();   //don't  clear    
		async clocked(c1,c2){
			say("A-1");
			c1.advance();
			say("A-2");
			c2.advance();
			//Clock.advanceAll();
			
		}
		say("root1");
		c2.advance();
		say("root2");
		c1.advance();
		//System.sleep(100);
		
		//Clock.advanceAll();
		
		//Clock.advanceAll();
		say("root3");
		
	}
	public static def main(argv:Rail[String])
	{
		clocked finish {
			clocked async {
				System.sleep(1000);
				say("A-1");
				Clock.advanceAll();
				say("A-2");
			}
			clocked async {
				say("B-1");
				Clock.advanceAll();
				say("B-2");
			}
		}
	}
}