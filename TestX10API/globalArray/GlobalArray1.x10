package globalArray;
public class GlobalArray1 {
	//protected val sz:Long; // block size
    protected val raw:PlaceLocalHandle[Rail[long]]; 
    protected val num:Long; 
   //protected val f:(x:long)=>(y:long);
    def this(size:Long){long haszero} {
	val num=size/Place.numPlaces();
	this.num=num;
	raw = PlaceLocalHandle.make[Rail[long]](Place.places(), ()=>new Rail[long](num));	 
	}
// public operator this(i:long) =(v:long){val f=(long,PlaceLocalHandle[Rail[long]])=>(PlaceLocalHandle[Rail[long]])=(v,raw)=>{at(Place(i/num)) raw()(i%num)=v};} 
//public operator this(i:long) =(v:long){at(Place(i/num)) raw()(i%num)=v;} 
public operator this(i:Long)=at(Place(i/num)) raw()(i%(num));
// public static def main(Rail[String]) {
// 	val rail = new GlobalArray1(20); 
// 	for(i in 0..19){rail(i)=-1;}
// 	for(i in 0..19){Console.OUT.println("rail("+i+")="+rail(i));}
//  }
 }