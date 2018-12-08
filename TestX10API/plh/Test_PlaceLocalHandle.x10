package plh;
public class Test_PlaceLocalHandle{
	/*protected val chunk:Long; // block size
    protected val raw:PlaceLocalHandle[Rail[long]];
	public def this(size:Long){long haszero} {
		val chunk = size/Place.numPlaces();
		this.chunk = chunk;
		raw = PlaceLocalHandle.make[Rail[Long]](Place.places(), ()=>new Rail[long](chunk));
	}
	public operator this(i:Long) = (v:Long) { at(Place(i/chunk)) raw()(i%chunk) = v; }
	public operator this(i:Long) = at(Place(i/chunk)) raw()(i%chunk);
	public static def main(Rail[String]) {
		val rail = new Test_PlaceLocalHandle[Long](15);
		rail(7) = Place.numPlaces();
		Console.OUT.println(rail(7));
	}*/
	static val c =PlaceLocalHandle.make[Cell[Long]](Place.places(), ()=>new Cell[Long](-1));
	static public def main(Rail[String]) {
		for(p in Place.places()) at(p) { c()(p.id); }
		Console.OUT.println("Place.places()="+"("+Place.places()+")");
		Console.OUT.println("cell:");
		for(p in Place.places()) at(p) { 
			Console.OUT.println(here+" "+c()());
			}
		Console.OUT.println("static");
		for(p in Place.places()) at(p) { Console.OUT.println(here.id + " " + c()()); }
		val c = Test_PlaceLocalHandle.c;
		Console.OUT.println("local");
		for(p in Place.places()) at(p) { Console.OUT.println(here.id + " " + c()()); }
	}
}