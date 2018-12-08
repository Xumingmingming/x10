package plh;

public class globalrefTest {
	static val result=GlobalRef[Cell[Long]](new Cell[Long](0));
	static val s=1L;
	/*每一个place都能访问到，相当于全局定义*/
	public static def main(args:Rail[String]){
		val result1=GlobalRef[Cell[Long]](new Cell[Long](1));
		/*只有place(0)能访问到*/
		val num:Long=5;
		/*必须定义val其他place才可以用,定义var其他place不能用*/ 
		finish for (p in Place.places()){
			val result2=GlobalRef[Cell[Long]](new Cell[Long](2));
			/*只有place(0)能访问到*/
			at(p) async{ 
				val result3=GlobalRef[Cell[Long]](new Cell[Long](3));
				var numP:long=2;   
				/*可以定义同名不同place之间.*/
				//Console.OUT.println("here="+here+","+"here.id="+here.id+","+"result()="+result()+","+"result()()="+result()()+","+"num="+num+","+"numP="+numP);
				//here=Place(0),here.id=0,result()=Cell(0),result()()=0,num=5,numP=2
				//here=Place(1),here.id=1,result()=Cell(0),result()()=0,num=5,numP=2
				//here=Place(2),here.id=2,result()=Cell(0),result()()=0,num=5,numP=2
				//Console.OUT.println("here="+here+","+"result3()()="+result3()());
				//here=Place(0),result3()()=3
				//here=Place(1),result3()()=3
				//here=Place(2),result3()()=3
				/*result3相当于局部定义,每个place中都存在result3 */
				//Console.OUT.println(s);
				//1
				//1
				//1
				atomic 
				{
					result()()=result()()+here.id;
					//Console.OUT.println(here+","+result()()); 
					//Place(0),0    
					//Place(1),1    
					//Place(2),2
				}
				at(result1) atomic result1()()=result1()()+p.id;
				Console.OUT.println("here="+here+","+"result1()()="+result1()());
				//here=Place(0),result1()()=1
				at(result2) atomic result2()()=result2()()+p.id;
				//Console.OUT.println("here="+here+","+"result2()()="+result2()());
				//here=Place(0),result2()()=2
				/*result1,result2作用域一致，都只在place(0)，因此只能place(0)访问到。 */ 
			}
			//Console.OUT.println("here="+here+","+"here.id="+here.id+","+"result()="+result()+","+"result()()="+result()()+","+"num="+num);
			//here=Place(0),here.id=0,result()=Cell(0),result()()=0,num=5
			// here=Place(0),here.id=0,result()=Cell(0),result()()=0,num=5
			// here=Place(0),here.id=0,result()=Cell(0),result()()=0,num=5
			//Console.OUT.println("here="+here+","+"here.id="+here.id+","+"result1()="+result1()+","+"result1()()="+result1()()+","+"num="+num);
			//here=Place(0),here.id=0,result1()=Cell(1),result1()()=1,num=5
			//here=Place(0),here.id=0,result1()=Cell(1),result1()()=1,num=5
			//here=Place(0),here.id=0,result1()=Cell(1),result1()()=1,num=5
			//Console.OUT.println("here="+here+","+"here.id="+here.id+","+"result2()="+result2()+","+"result2()()="+result2()()+","+"num="+num); 
			//here=Place(0),here.id=0,result2()=Cell(2),result2()()=2,num=5
			//here=Place(0),here.id=0,result2()=Cell(2),result2()()=2,num=5
			//here=Place(0),here.id=0,result2()=Cell(2),result2()()=2,num=5   
			/*numP,result3访问不到,因为numP启动P(Place.places())中activity时才被定义*/
		}
	}
}
