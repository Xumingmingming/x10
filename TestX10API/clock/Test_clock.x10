/*clocked async不能这么写 
 * It may spawn and simultaneously register a new activity on c, with the statement async clocked(c)S.
 * clocked(c) async和async clocked(c)S区别 */
package clock;
public class Test_clock {
	static def say(s:String) {
		Console.OUT.println(s);
	}
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	/*Console.OUT.println("单Place多activity：");
    	finish async{
    		 val cl = Clock.make();
    		  async clocked(cl) {// Activity A
    			//System.sleep(1000);
    			say(here+":");
    			say("A-1");
    			Clock.advanceAll();
    			say("A-2");
    			Clock.advanceAll();
    			say("A-3");
    		}// Activity A
    		  async clocked(cl) {// Activity B
    			say(here+":");
    			say("B-1");
    			Clock.advanceAll();
    			say("B-2");
    			Clock.advanceAll();
    			say("B-3");
    		}// Activity B
             async clocked(cl) {// Activity C
    			say(here+":");
    			say("C-1");
    			Clock.advanceAll();
    			say("C-2");
    			Clock.advanceAll();
    			say("C-3");
    		}// Activity C
    	}*/
    	// Console.OUT.println("多Place多activity同步：");
    	// val c2 = Clock.make();
    	// 	async clocked(c2) at(Place(0))
    	// 	{
    	// 	say(here+":"+"stage1:hahaha");
    	// 	Clock.advanceAll();
    	// 	say(here+":"+"stage2:hahaha");
    	// 	}  		
     //      async clocked(c2) at(Place(1))
    	// 	 {
    	// 		say(here+":"+"stage1:hahaha");
    	// 		Clock.advanceAll();
    	// 		say(here+":"+"stage2:hahaha");
    	// 	}  		
     //      async clocked(c2) at(Place(2))
    	// 	 {
    	// 		say(here+":"+"stage1:hahaha");
    	// 		Clock.advanceAll();
    	// 		say(here+":"+"stage2:hahaha");
    	// 	}  		
    	
    	/*Console.OUT.println("Test two Clock c.resume():：");   
    	val c3 = Clock.make();
    	val c4 = Clock.make();
    	async clocked(c3,c4) at(Place(0))  {
    		{
    			say(here+" c3: "+"stage1:hahaha");
    			c3.advance();
    			System.sleep(1000);
    			async say(here+" c4: "+"stage1:hahaha");
    			c4.advance();
    			say(here+" c3: "+"stage2:hahaha");
    			c3.advance();
    			say(here+" c4: "+"stage2:hahaha");
    		}  		
    	}
    	async clocked(c3,c4) at(Place(1))  {
    		{
    			say(here+" c3: "+"stage1:hahaha");
    			c3.advance();
    			System.sleep(1000);
    			async say(here+" c4: "+"stage1:hahaha");
    			c4.advance();
    			say(here+" c3: "+"stage2:hahaha");
    			c3.advance();
    			say(here+" c4: "+"stage2:hahaha");
    		}  		
    	}
    	async clocked(c3,c4) at(Place(2))  {
    		{
    			say(here+" c3: "+"stage1:hahaha");
    			c3.advance();
    			System.sleep(1000);
    			async say(here+" c4: "+"stage1:hahaha");
    			c4.advance();
    			say(here+" c3: "+"stage2:hahaha");
    			c3.advance();
    			say(here+" c4: "+"stage2:hahaha");
    		}  		
    	}*/
    	Console.OUT.println("Test clocked finish:"); 
    	clocked finish {
    		for (p in Place.places()) {
    			 at (p)  clocked async  {
    				for (count in 1..3) {
    					Console.OUT.println(here+"before( "+count+" )");
    					Clock.advanceAll();
    					Console.OUT.println(here+"after( "+count+" )");
    					Clock.advanceAll();
    				}
    			}
    		}
    	}
   }
}