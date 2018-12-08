package clock;

class ClockTest {
	static def say(s:String) {
		Console.OUT.println(s);
	}
	public static def main2(argv:Rail[String]) {
		finish async{
			val cl = Clock.make();
			
			async clocked(cl) {// Activity A
				say("A-1");
				Clock.advanceAll();
				say("A-2");
				Clock.advanceAll();
				say("A-3");
			}// Activity A
			
			async clocked(cl) {// Activity B
				say("B-1");
				Clock.advanceAll();
				say("B-2");
				Clock.advanceAll();
				say("B-3");
			}// Activity B
			Console.OUT.println("root-1");
			Clock.advanceAll();
			Console.OUT.println("root-2");
			Clock.advanceAll();
			Console.OUT.println("root-3");
			Clock.advanceAll();
		}
	}
	public static def main3(argv:Rail[String])
	{
		finish async{
			System.sleep(1000);
			Console.OUT.println("ac-root");
			async {
				Console.OUT.println("ac-1");
				System.sleep(1000);
			}
			async{
				Console.OUT.println("ac-2");
				System.sleep(1000);
			}
			
		}
		async {Console.OUT.println("ac-out");}
	}
	public static def main(argv:Rail[String])
	{
		val c=Clock.make();
		
		async clocked(c){
			say("A-1");
			//Clock.advanceAll();
			say("A-2");
			//Clock.advanceAll();
			say("A-3");
			Clock.advanceAll();
			say("A-4");
			//Clock.advanceAll();
			
		}
		System.sleep(1000);
		//System.sleep(3000);
		Console.OUT.println("root-1");
		System.sleep(1000);
		//Clock.advanceAll();
		Console.OUT.println("root-2");
		//Clock.advanceAll();
		Console.OUT.println("root-3");
		Clock.advanceAll();
	}
	

}