package redefine;

public class Redefine_ifToGA {
	protected val size:long;
	protected val num:long;
	protected val raw:PlaceLocalHandle[Rail[long]];
	def this(size:long){
		this.size=size;
		val num=size/Place.numPlaces();
		this.num=num;
		raw = PlaceLocalHandle.make[Rail[long]](Place.places(), ()=>new Rail[long](num));
	}
	public operator if(then: ()=>void, else_: ()=>void) {
		if (size%Place.numPlaces()==0) {
			then();
		} else {
			else_();
		}
	}
	public static def make(){
		//val redefine_ifToGA=new Redefine_ifToGA();
	}
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    }
}