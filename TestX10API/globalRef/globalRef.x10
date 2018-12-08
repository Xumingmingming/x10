package globalRef;
public class globalRef {
	static val result=GlobalRef[Rail[long]](new Rail[Long](4,(i:Long)=>i+here.id));
	public static def main(Rail[String]) {
	// val result=GlobalRef[Rail[long]](new Rail[Long](0));
	  //var num:Int=0n;
	 /* finish for(p in Place.places()) at(p)
	  async{
	  at(result) atomic {
		 // result()()=here.id;
		  Console.OUT.println(here+"  "+"result= "+result+"  "+"result()= "+result()+"result()()= "+result()(3));
		  }
	  }
	  Console.OUT.println(result);*/
	 val result2=GlobalRef[Rail[long]](new Rail[Long](4,(i:Long)=>i+here.id));
	  Console.OUT.println("和PlaceLocalHandle比较：");
	  finish{	for(p in Place.places()) 
		  at(p) {
		  Console.OUT.println(here+"  "+"result= "+result+"  "+"result()= "+result()+"result()(3)= "+result()(3));
		  Console.OUT.println("在里面：");
		  Console.OUT.println(here);
		  Console.OUT.print(result()(0)+" ");
		  Console.OUT.print(result()(1)+" ");
		  Console.OUT.print(result()(2)+" ");
		  Console.OUT.println(result()(3)+" ");
	  }
	  Console.OUT.println("在外面：");
	  Console.OUT.println(here);
	  Console.OUT.print(result()(0)+" ");
	  Console.OUT.print(result()(1)+" ");
	  Console.OUT.print(result()(2)+" ");
	  Console.OUT.println(result()(3)+" ");
	  }
	  Console.OUT.println("局部globalRef");
	  finish{	for(p in Place.places()) 
		  at(p) {
		  Console.OUT.println(here+"  "+"result2= "+result2+"  "+"result2()= "+result2()+"result2()(3)= "+result2()(3));
		  Console.OUT.println("在里面：");
		  Console.OUT.println(here);
		  Console.OUT.print(result2()(0)+" ");
		  Console.OUT.print(result2()(1)+" ");
		  Console.OUT.print(result2()(2)+" ");
		  Console.OUT.println(result2()(3)+" ");
	  }
	  Console.OUT.println("在外面：");
	  Console.OUT.println(here);
	  Console.OUT.print(result2()(0)+" ");
	  Console.OUT.print(result2()(1)+" ");
	  Console.OUT.print(result2()(2)+" ");
	  Console.OUT.println(result2()(3)+" ");
	  }
}
}