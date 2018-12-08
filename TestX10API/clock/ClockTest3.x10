package clock;

public class ClockTest3 {
	public static def main(argv:Rail[String])
	{
		clocked finish {
			for (p in Place.places()) {
				at (p) clocked async {
					 for(count in 1..2)
					 {
						Console.OUT.println("here.id="+here.id+"first");
						Clock.advanceAll();
						Console.OUT.println("here.id="+here.id+"second");
						Clock.advanceAll();
					 }
						
					
				}
			}
	}
}
	/*public static def main(argv:Rail[String])
	{
		val c=Clock.make();
		for(p in Place.places())
		{
			at(p) async clocked(c)
			{
				Console.OUT.println("here.id="+here.id+"first"+c);
				System.sleep(1000);
				Clock.advanceAll();
				Console.OUT.println("here.id="+here.id+"second");
				Clock.advanceAll();
			}
		}
	}*/
}