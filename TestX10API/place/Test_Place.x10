/*assert:The statement assert E checks that the Boolean expression E evaluates to true, and,
if not, throws an x10.lang.Error exception.*/
package place;
public class Test_Place {
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	Console.OUT.println("Place.places()(0)= "+Place.places()(0));
    	Console.OUT.println("here= "+here);
    	Console.OUT.println("here.id= "+here.id);
    	Console.OUT.println("Place.places()="+Place.places());
    	//Console.OUT.println("Place.places(0)="+Place.places(0));
    	//Console.OUT.println("this "+this);
    	//Console.OUT.println("self "+self);
    	/*The following example creates a rail a located here, and copies it to
    	 * another place. a in the second place refers to the copy. The copy is modified and
    	 * examined. After the at finishes, the original is also examined, and (since only the
         * copy, not the original, was modified) is observed to be unchanged*/
    	Console.OUT.println("rail at places:");
    	val a = [1,2,3];
    	val world = Place.places();
    	at(world.next(here)) {
    		Console.OUT.println("复制前的a(1)="+a(1));
    		a(1) = 4;
    		Console.OUT.println(here+":复制修改后的a(1)="+a(1));
    		assert a(0)==1 && a(1)==4 && a(2)==3;
    	}
    	assert a(0)==1 && a(1)==2 && a(2)==3;
    	Console.OUT.println(here+":a(1)="+a(1));
    	/*Console.OUT.println("copying from at:");
    	val c = new Cell[Long](5);
    	val a : Rail[Cell[Long]] = [c,c as Cell[Long]];
    	assert(a(0)() == 5 && a(1)() == 5); // (A)
    	c.set(6); // (B)
    	assert(a(0)() == 6 && a(1)() == 6); // (C)
    	at(here) {
    		assert(a(0)() == 6 && a(1)() == 6); // (D)
    		c.set(7); // (E)
    		assert(a(0)() == 7 && a(1)() == 7); // (F)
    	}
    	assert(a(0)() == 6 && a(1)() == 6); // (G)
    	 */
    }
}
