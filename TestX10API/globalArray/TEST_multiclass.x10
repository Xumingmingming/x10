/*平行类无法实现，提示相同的错误*/
package globalArray;

public class TEST_multiclass {
	public static def make(size:Long){
		//val globalarray=new GlobalArray();
		if(size%Place.numPlaces()==0){
			val globalArray1=new Can_Zero(size);
			Console.OUT.println("到达if！");
			return globalArray1; }
		else{
			val globalArray1=new No_Can_Zero(size);
			Console.OUT.println("到达else！");
			return globalArray1;
		}
	}
    // public static def main(args: Rail[String]) {
    //     // TODO auto-generated stub
    // 	val globalarray= new GlobalArray();
    // 	val rail1 =GlobalArray.make(18);
    // 	val rail2=GlobalArray.make(20);
    // 	rail1(1)=1;
    // 	for(i in 0..17){Console.OUT.println("rail1("+i+")="+rail1(i));}
    // }
}
 class Can_Zero  {
	public val raw:PlaceLocalHandle[Rail[long]]; 
	public val num:Long; 
	public val size:Long; 
	public def this(size:Long){
		this.size = size;
		val num=size/Place.numPlaces();
		this.num=num;
		raw = PlaceLocalHandle.make[Rail[long]](Place.places(), ()=>new Rail[long](num));
		Console.OUT.println("可以整除！");
	}
	public operator this(i:long) =(v:long){at(Place(i/num)) raw()(i%num)=v;} 
	public operator this(i:Long) = at(Place(i/num)) raw()(i%num);
}
 class No_Can_Zero  {
	public val raw:PlaceLocalHandle[Rail[long]]; 
	public val num:Long; 
	public val size:Long; 
	public def this(size:Long){long haszero} {
		this.size=size;
		val num=size/Place.numPlaces();
		this.num=num;
		raw = PlaceLocalHandle.make[Rail[long]](Place.places(), ()=>new Rail[long](num));
		PlaceLocalHandle.addPlace[Rail[long]](raw,Place(Place.numPlaces()-1),()=>new Rail[long](num+size%(num*Place.numPlaces())));
		Console.OUT.println("不可以整除！");	
	}
	public operator this(i:long) =(v:long){at(Place(i/num-i/(num*Place.numPlaces()))) raw()(i%num+num*(i/(num*Place.numPlaces())))=v;}                                 
	public operator this(i:Long)=at(Place(i/num-i/(num*Place.numPlaces()))) raw()(i%num+num*(i/(num*Place.numPlaces())));
}