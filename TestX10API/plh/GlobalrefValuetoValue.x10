package plh;
public class GlobalrefValuetoValue {
	static val places = Place.places();
	public static def main(args:Rail[String]): void {
		val result1=GlobalRef[Cell[Long]](new Cell[Long](1));
		val t=GlobalRef[Cell[Long]](new Cell[Long](0));
		finish for(p in places) {
			at(p) 
			async {
				System.sleep(2000);
				val result2=GlobalRef[Cell[Long]](new Cell[Long](2));	   
				at(t){
					t()()=at(result1)result1()();
					Console.OUT.println(p+",t()()="+t()());
					System.sleep(1000);
					at(result1)result1()()=at(result2)result2()();
					Console.OUT.println(p+",result1()()="+result1()());
					System.sleep(1000);
					at(result2){
						result2()()=at(t)t()();
						Console.OUT.println(p+",result2()()="+result2()());
						System.sleep(1000);
					}
					at(result1)Console.OUT.println(p+",result1()()="+result1()());
					System.sleep(1000);
					at(result2)Console.OUT.println(p+",result2()()="+result2()());
				}	
			}
		}
		Console.OUT.println(here+","+"t()()="+t()());
		at(result1)Console.OUT.println(here+","+"result1()()="+result1()());
	}
}