package plh;
public class PlaceLocalHandleTest {
	
	static val places = Place.places();
	static val c1 = PlaceLocalHandle.make[Cell[Long]](places, ()=>new Cell[Long](-1));
	/*在参数places中的每个位置创建一个类型为Cell[Long]的本地状态的分布式对象。*/
	static val c2 = PlaceLocalHandle.make[Cell[Long]](places, ()=>new Cell[Long](0));
	static public def main(Rail[String]){
		Console.OUT.println(places);
		//x10.lang.PlaceGroup.SimplePlaceGroup@9c6c30
		Console.OUT.println(c1);
		//PlaceLocalHandle(Id(0,1))
		Console.OUT.println(c2);
		//PlaceLocalHandle(Id(0,2))
		for(p in places) at(p) {
			Console.OUT.println("p="+p);
			Console.OUT.println("c1="+c1);
			Console.OUT.println("c1()="+c1());
			Console.OUT.println("c1()()="+c1()());
			//p=Place(0)
			//c1=PlaceLocalHandle(Id(0,1))
			//c1()=Cell(-1)
			//c1()()=-1
			//p=Place(1)
			//c1=PlaceLocalHandle(Id(1,1))
			//c1()=Cell(-1)
			//c1()()=-1
			//p=Place(2)
			//c1=PlaceLocalHandle(Id(2,1))
			//c1()=Cell(-1)
			//c1()()=-1
			//p=Place(3)
			//c1=PlaceLocalHandle(Id(3,1))
			//c1()=Cell(-1)
			//c1()()=-1
			c1()(p.id);
		}
		Console.OUT.println("static");
		for(p in places) at(p) {
			Console.OUT.println("p="+p);
			Console.OUT.println("c1="+c1);
			Console.OUT.println("c1()="+c1());
			Console.OUT.println("c1()()="+c1()());
			//p=Place(0)
			//c1=PlaceLocalHandle(Id(0,1))
			//c1()=Cell(0)
			//c1()()=0
			//p=Place(1)
			//c1=PlaceLocalHandle(Id(1,1))
			//c1()=Cell(1)
			//c1()()=1
			//p=Place(2)
			//c1=PlaceLocalHandle(Id(2,1))
			//c1()=Cell(2)
			//c1()()=2
			//p=Place(3)
			//c1=PlaceLocalHandle(Id(3,1))
			//c1()=Cell(3)
			//c1()()=3
		}
		Console.OUT.println("cInPlace0:");
		val cInPlace0 = PlaceLocalHandleTest.c1;
		for(p in places) at(p) {
			Console.OUT.println("p="+p);
			Console.OUT.println("cInPlace0="+cInPlace0);
			Console.OUT.println("cInPlace0()="+cInPlace0());
			Console.OUT.println("cInPlace0()()="+cInPlace0()());
			//cInPlace0:
			//p=Place(0)
			//cInPlace0=PlaceLocalHandle(Id(0,1))
			//cInPlace0()=Cell(0)
			//cInPlace0()()=0
			//p=Place(1)
			//cInPlace0=PlaceLocalHandle(Id(0,1))
			//cInPlace0()=Cell(-1)
			//cInPlace0()()=-1
			//p=Place(2)
			//cInPlace0=PlaceLocalHandle(Id(0,1))
			//cInPlace0()=Cell(-1)
			//cInPlace0()()=-1
			//p=Place(3)
			//cInPlace0=PlaceLocalHandle(Id(0,1))
			//cInPlace0()=Cell(-1)
			//cInPlace0()()=-1
		}
		at(Place(1)){
			Console.OUT.println("cInPlace1:");
			val cInPlace1= PlaceLocalHandleTest.c1;
			for(p in places) at(p) {
				Console.OUT.println("p="+p);
				Console.OUT.println("cInPlace1="+cInPlace1);
				Console.OUT.println("cInPlace1()="+cInPlace1());
				Console.OUT.println("cInPlace1()()="+cInPlace1()());
				//cInPlace1:
				//p=Place(0)
				//cInPlace1=PlaceLocalHandle(Id(1,1))
				//cInPlace1()=Cell(-1)
				//cInPlace1()()=-1
				//p=Place(1)
				//cInPlace1=PlaceLocalHandle(Id(1,1))
				//cInPlace1()=Cell(1)
				//cInPlace1()()=1
				//p=Place(2)
				//cInPlace1=PlaceLocalHandle(Id(1,1))
				//cInPlace1()=Cell(-1)
				//cInPlace1()()=-1
				//p=Place(3)
				//cInPlace1=PlaceLocalHandle(Id(1,1))
				//cInPlace1()=Cell(-1)
				//cInPlace1()()=-1
			}
		}
		at(Place(2)){
			Console.OUT.println("cInPlace2:");
			val cInPlace2= PlaceLocalHandleTest.c1;
			for(p in places) at(p) {
				Console.OUT.println("p="+p);
				Console.OUT.println("cInPlace2="+cInPlace2);
				Console.OUT.println("cInPlace2()="+cInPlace2());
				Console.OUT.println("cInPlace2()()="+cInPlace2()());
				//cInPlace2:
				//p=Place(0)
				//cInPlace2=PlaceLocalHandle(Id(2,1))
				//cInPlace2()=Cell(-1)
				//cInPlace2()()=-1
				//p=Place(1)
				//cInPlace2=PlaceLocalHandle(Id(2,1))
				//cInPlace2()=Cell(-1)
				//cInPlace2()()=-1
				//p=Place(2)
				//cInPlace2=PlaceLocalHandle(Id(2,1))
				//cInPlace2()=Cell(2)
				//cInPlace2()()=2
				//p=Place(3)
				//cInPlace2=PlaceLocalHandle(Id(2,1))
				//cInPlace2()=Cell(-1)
				//cInPlace2()()=-1
			}
		} 
	}
}