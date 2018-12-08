/*实验证明PlaceLocalHandle不管用不用static声名都能实现相同的功能*/
package plh;
public class My_Test_PLH {
	//static val c =PlaceLocalHandle.make[Cell[Long]](Place.places(), ()=>new Cell[Long](-1));
	static val raw1 = PlaceLocalHandle.make[Rail[Long]](Place.places(), ()=>new Rail[long](4,(i:Long)=>i+here.id));
	//static val result=GlobalRef[Rail[long]](new Rail[Long](4,(i:Long)=>i+here.id));
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	val plh=new My_Test_PLH();
        val raw2 = PlaceLocalHandle.make[Rail[Long]](Place.places(), ()=>new Rail[long](4,(i:Long)=>i+here.id));
        Console.OUT.println("static变量PlaceLocalHandle：");
    finish{	for(p in Place.places()) 
    		at(p) {
    		Console.OUT.println(here+" "+"raw= "+raw1+" raw()="+raw1());
    		Console.OUT.println(here);
    		Console.OUT.print(raw1()(0)+" ");
    		Console.OUT.print(raw1()(1)+" ");
    		Console.OUT.print(raw1()(2)+" ");
    		Console.OUT.println(raw1()(3)+" ");
    		}
    }
        Console.OUT.println("在外面：");
        Console.OUT.println(here);
    	Console.OUT.print(raw1()(0)+" ");
    	Console.OUT.print(raw1()(1)+" ");
    	Console.OUT.print(raw1()(2)+" ");
    	Console.OUT.println(raw1()(3)+" ");
   
    Console.OUT.println("局部变量PlaceLocalHandle：");
    Console.OUT.println("在for循环里面：");
    finish{	for(p in Place.places()) 
    at(p) {
    Console.OUT.println(here+" "+"raw2= "+raw2+" raw2()="+raw2());
    
    Console.OUT.print(raw2()(0)+" ");
    Console.OUT.print(raw2()(1)+" ");
    Console.OUT.print(raw2()(2)+" ");
    Console.OUT.println(raw2()(3)+" ");
    }
    }
    Console.OUT.println("类.PLH：");
    finish{	for(p in Place.places()) 
    	at(p) {
    	Console.OUT.println(here+" "+"raw2= "+raw2+" raw2()="+raw2());
    	
    	Console.OUT.print(raw2()(0)+" ");
    	Console.OUT.print(raw2()(1)+" ");
    	Console.OUT.print(raw2()(2)+" ");
    	Console.OUT.println(raw2()(3)+" ");
    }
    }
    Console.OUT.print("在for循环外面： ");
    Console.OUT.print(raw2()(0)+" ");
    Console.OUT.print(raw2()(1)+" ");
    Console.OUT.print(raw2()(2)+" ");
    Console.OUT.println(raw2()(3)+" ");
    
    //无法直接at（ PlaceLocalHandle）对象
    /* finish for(p in Place.places()){
    	async at(raw){
    		
    	}
    } */
   /* Console.OUT.println("新用法2： ");
    for(p in Place.places()) at(p) {
    	
    	for(i in 0..3){
    		Console.OUT.println(plh.raw.operator()());
    		Console.OUT.println("local000000000000 Place"+here.id + " " + plh.raw.operator()().operator()(i)+" $$ "+raw);
    	}
    }
    	Console.OUT.println("other:");
    	at(Place.places().next(here)){
    	Console.OUT.println(here);
    	Console.OUT.print(raw()(0)+" ");
    	Console.OUT.print(raw()(1)+" ");
    	Console.OUT.print(raw()(2)+" ");
    	Console.OUT.print(raw()(3)+" ");
    	}*/
     }
}