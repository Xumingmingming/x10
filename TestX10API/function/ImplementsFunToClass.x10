package function;
public class ImplementsFunToClass{
	public val raw:PlaceLocalHandle[Rail[long]]; 
	public val num:Long; 
	public val size:Long; 
	public def this(size:Long){
		this.size = size;
		val num=size/Place.numPlaces();
		this.num=num;
		if(size%Place.numPlaces()!=0){
			raw = PlaceLocalHandle.make[Rail[long]](Place.places(), ()=>new Rail[long](num));
			//at(Place(Place.numPlaces()-1)) PlaceLocalHandle.addPlace[Rail[long]](raw,Place(Place.numPlaces()-1),()=>new Rail[long](num+size%(num*Place.numPlaces())));
		 val nobuke:(long,long,PlaceLocalHandle[Rail[long]])=>void=(num:long,size:long,raw:PlaceLocalHandle[Rail[long]])=>{at(Place(Place.numPlaces()-1)) PlaceLocalHandle.addPlace[Rail[long]](raw,Place(Place.numPlaces()-1),()=>new Rail[long](num+size%(num*Place.numPlaces())));
		// for(p in Place.places()) {at(p){
		// 	 Console.OUT.println(here+":"+"plh()="+raw()+" "+"raw="+raw+" ");
		//  }}
		 };//在最后一个place中更新PLH中的rail数量，即所有余下的数都放如最后一个place中
			nobuke(num,size,raw);
			Console.OUT.println("不可以整除！");	
		}
		else{
			raw = PlaceLocalHandle.make[Rail[long]](Place.places(), ()=>new Rail[long](num));
			Console.OUT.println("可以整除！");
		}
	}
	//public val nobuke:(long,long,PlaceLocalHandle[Rail[long]])=>void=(num:long,size:long,raw:PlaceLocalHandle[Rail[long]])=>{at(Place(Place.numPlaces()-1)) PlaceLocalHandle.addPlace[Rail[long]](raw,Place(Place.numPlaces()-1),()=>new Rail[long](num+size%(num*Place.numPlaces())));};
	//能整除
	public val f1:(long,long,long,PlaceLocalHandle[Rail[long]])=>void=(i:long,v:long,num:long,raw:PlaceLocalHandle[Rail[long]])=>{at(Place(i/num)) raw()(i%num)=v;};
	public val f2:(long,long,PlaceLocalHandle[Rail[long]])=>long=(i:long,num:long,raw:PlaceLocalHandle[Rail[long]])=>{at(Place(i/num)) raw()(i%num)};
	//不能整除
	public val f3:(long,long,long,PlaceLocalHandle[Rail[long]])=>void=(i:long,v:long,num:long,raw:PlaceLocalHandle[Rail[long]])=>{at(Place(i/num-i/(num*Place.numPlaces())-i/(num*(Place.numPlaces()+1)))) raw()(i%num+num*(i/(num*Place.numPlaces())))=v;};
	public val f4:(long,long,PlaceLocalHandle[Rail[long]])=>long=(i:long,num:long,raw:PlaceLocalHandle[Rail[long]])=>{at(Place(i/num-i/(num*Place.numPlaces())-i/(num*(Place.numPlaces()+1)))) raw()(i%num+num*(i/(num*Place.numPlaces())))};
	public operator this(i:long) =(v:long){if(size%Place.numPlaces()==0){f1(i,v,num,raw);}
	else{f3(i,v,num,raw);}};
	public operator this(i:Long) =size%Place.numPlaces()==0?at(Place(i/num)) raw()(i%num):at(Place(i/num-i/(num*Place.numPlaces())-i/(num*(Place.numPlaces()+1)))) raw()(i%num+num*(i/(num*Place.numPlaces())));
	
	/*public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	val rail1 = new ImplementsFunToClass(20);
    	for(i in 0..19){rail1(i)=i;}
    	for(i in 0..19){Console.OUT.println("rail1("+i+")="+rail1(i));}
    	val rail2 =new ImplementsFunToClass(19);
    	for(i in 0..18){rail2(i)=-1;}
    	for(i in 0..18){Console.OUT.println("rail2("+i+")="+rail2(i));}
    }*/
}