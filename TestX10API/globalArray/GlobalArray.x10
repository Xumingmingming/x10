/*place数+1*/
package globalArray;
public class GlobalArray {
	//protected val sz:Long; // block size
	protected val raw:PlaceLocalHandle[Rail[long]]; 
	protected val num:Long; 
	def this(size:Long){long haszero} {
		val num=size/Place.numPlaces()+1;
		this.num=num;
		raw = PlaceLocalHandle.make[Rail[long]](Place.places(), ()=>new Rail[long](num));	 
	}
	public operator this(i:long) =(v:long){at(Place(i/num)) raw()(i%num)=v;} 
	public operator this(i:Long)=at(Place(i/num)) raw()(i%(num));
	public static def main(Rail[String]) {
	Console.OUT.println("可整除情况：");
	  val rail = new GlobalArray(20); 
	  for(i in 0..19){rail(i)=i;}
	  for(i in 0..19){Console.OUT.println("rail("+i+")="+rail(i));}
	  Console.OUT.println("不可整除情况：");
	  val rail2 = new GlobalArray(21); 
	  for(i in 0..20){rail2(i)=i*2;}
	  for(i in 0..20){Console.OUT.println("rail2("+i+")="+rail2(i));}
	  }
}
/*operator方法不能定义成static
 * 内部类实现*/
// package globalArray;
// public class GlobalArray { 
// 	public static def make(size:Long){
// 		//val globalarray=new GlobalArray();
// 		if(size%Place.numPlaces()==0){
// 			val globalArray1=new Can_Zero(size);
// 			Console.OUT.println("到达if！");
// 			return globalArray1; }
// 		else{
// 			val globalArray1=new No_Can_Zero(size);
// 			Console.OUT.println("到达else！");
// 			return globalArray1;
// 		}
// 	}
// 	/*public static def use_make(){
// 	 * val obj=GlobalArray.make(18);
// 	 * obj(1)=10;
// 	 * 
// 	 * }*/
// 	public static class Can_Zero  {
// 		public val raw:PlaceLocalHandle[Rail[long]]; 
// 		public val num:Long; 
// 		public val size:Long; 
// 		public def this(size:Long){
// 			this.size = size;
// 			val num=size/Place.numPlaces();
// 			this.num=num;
// 			raw = PlaceLocalHandle.make[Rail[long]](Place.places(), ()=>new Rail[long](num));
// 			Console.OUT.println("可以整除！");
// 		}
// 		public operator this(i:long) =(v:long){at(Place(i/num)) raw()(i%num)=v;} 
// 		public operator this(i:Long) = at(Place(i/num)) raw()(i%num);
// 	}
// 	public static class No_Can_Zero  {
// 		public val raw:PlaceLocalHandle[Rail[long]]; 
// 		public val num:Long; 
// 		public val size:Long; 
// 		public def this(size:Long){long haszero} {
// 			this.size=size;
// 			val num=size/Place.numPlaces();
// 			this.num=num;
// 			raw = PlaceLocalHandle.make[Rail[long]](Place.places(), ()=>new Rail[long](num));
// 			PlaceLocalHandle.addPlace[Rail[long]](raw,Place(Place.numPlaces()-1),()=>new Rail[long](num+size%(num*Place.numPlaces())));
// 			Console.OUT.println("不可以整除！");	
// 		}
// 		public operator this(i:long) =(v:long){at(Place(i/num-i/(num*Place.numPlaces()))) raw()(i%num+num*(i/(num*Place.numPlaces())))=v;}                                 
// 		public operator this(i:Long)=at(Place(i/num-i/(num*Place.numPlaces()))) raw()(i%num+num*(i/(num*Place.numPlaces())));
// 	}
// 	public static def main(args: Rail[String]) {
// 		// TODO auto-generated stub
// 		val globalarray= new GlobalArray();
// 		val rail1 =GlobalArray.make(18);
// 		val rail2=GlobalArray.make(20);
// 		GlobalArray.rail1(1)=1;
// 		for(i in 0..17){Console.OUT.println("rail1("+i+")="+GlobalArray.rail1(i));}
// 		/*for(i in 0..17){rail1(i)=i;}
// 		 * for(i in 0..17){Console.OUT.println("rail1("+i+")="+rail1(i));}
// 		 * val rail2 = new Can_Zero(20);
// 		 * for(i in 0..19){rail1(i)=i;}
// 		 * for(i in 0..19){Console.OUT.println("rail1("+i+")="+rail1(i));}
// 		 * val rail2 = new Can_Zero(18);
// 		 * for(i in 0..17){rail2(i)=i;}
// 		 * for(i in 0..17){Console.OUT.println("rail2("+i+")="+rail2(i));}*/
// 	}
// }