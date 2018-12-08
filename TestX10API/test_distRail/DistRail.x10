package test_distRail;
public class DistRail {
protected val chunk:Long;
protected val raw:PlaceLocalHandle[Rail[long]];
public def this(size:Long){long haszero} {
val chunk = size/Place.numPlaces(); 
this.chunk = chunk;
raw = PlaceLocalHandle.make[Rail[long]](Place.places(), ()=>new Rail[long](chunk));
}
public operator this(i:Long) = (v:long) { at(Place(i/chunk)) raw()(i%chunk) = v; }
public operator this(i:Long) = at(Place(i/chunk)) raw()(i%chunk);
/*public static def main(Rail[String]) {
val disRail= new DistRail(19);
for(i in 0..15){disRail(i)=i;}
for(i in 0..15) {Console.OUT.println(disRail(i));}
}*/
}