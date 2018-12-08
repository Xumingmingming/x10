package globalArray;

public class Function_solve {
	protected val raw:PlaceLocalHandle[Rail[long]]; 
	protected var num:Long; 
	protected val size:Long; 
	public def this(size:Long){long haszero} {
		this.size=size;
		val num=size/Place.numPlaces();
		this.num=num;
		if(size%Place.numPlaces()!=0){
			raw = PlaceLocalHandle.make[Rail[long]](Place.places(), ()=>new Rail[long](num));
			PlaceLocalHandle.addPlace[Rail[long]](raw,Place(Place.numPlaces()-1),()=>new Rail[long](num+size%(num*Place.numPlaces())));
			Console.OUT.println("不可以整除！");	
		}
		else{
			raw = PlaceLocalHandle.make[Rail[long]](Place.places(), ()=>new Rail[long](num));
			Console.OUT.println("可以整除！");
		}
	}
	//不可整除
	//public operator this(i:long)=(v:long){at(Place(i/num-i/(num*Place.numPlaces()))) raw()(i%num+num*(i/(num*Place.numPlaces())))=v;}  
	//public operator this(i:Long)=at(Place(i/num-i/(num*Place.numPlaces()))) raw()(i%num+num*(i/(num*Place.numPlaces())));
	//可以整除
	public operator this(i:long) =(v:long){at(Place(i/num)) raw()(i%num)=v;} 
	public operator this(i:Long) = at(Place(i/num)) raw()(i%num);
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	val rail = new Function_solve(20); 
    	for(i in 0..19){rail(i)=i;}
    	for(i in 0..19){Console.OUT.println("rail("+i+")="+rail(i));}
    }
}