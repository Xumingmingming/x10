/*PlaceLocalHandle.addPlace方法的*/
package x10_test;
public class Test_addPlaceToPLH {
	static val plh=PlaceLocalHandle.make[Rail[long]](Place.places(),()=>new Rail[long](3,here.id));
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	Console.OUT.println("Place.numPlaces():"+Place.numPlaces());
    	Console.OUT.println("Place.places():"+Place.places());
    	/*finish{
    		for(p in Place.places()){
    		 at(p){
    			Console.OUT.println(here+":"+"plh()="+plh()+" "+"plh="+plh+" ");
    		}
    	}
    }*/
    	//plh()(1)=-1;
    	//at(Place(1)){plh()(1)=-1;}
    	//at(Place(2)){plh()(1)=-1;}
      // 	val p:PlaceGroup=PlaceGroup.make(4);
    	Console.OUT.println("addPlace后的PlaceLocalHandle：");
    	//PlaceLocalHandle.addPlace[Rail[long]](plh,Place(0),()=>new Rail[long](2,-1));
    	//PlaceLocalHandle.addPlace[Rail[long]](plh,Place(2),()=>new Rail[long](2,-1));
    	at(Place(2)){PlaceLocalHandle.addPlace[Rail[long]](plh,Place(2),()=>new Rail[long](2,-1));}
        //val plh1=PlaceLocalHandle.make[Rail[long]](p,()=>new Rail[long](2,-1));
    	//Console.OUT.println("P:"+p);
    	finish{
    		for(i in Place.places()){
    			at(i){
    				Console.OUT.println(here+":"+"plh()="+plh()+" "+"plh="+plh+" ");
    			}
    		}
    	}
   }
}