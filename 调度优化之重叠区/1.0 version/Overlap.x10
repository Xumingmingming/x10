import x10.regionarray.Array;
import x10.regionarray.Region;
import x10.array.Array_2;
/* 每个block都有2个重叠区，分左和右2个
 * overlap1:左边的重叠区
 * overlap2:右边的重叠区
 */
public class Overlap {
	//重叠区先设置为：0-4
	public  static val nOfoverlap=5n;
	private var overlap1:Array[Int];
	private var overlap2:Array[Int];
	public def this()
	{		
		val  R1 = Region.make(0..(nOfoverlap-1), 0..(Grid.Grid_YMax-1)); 
		overlap1=new Array[Int](R1,0 as Int);
		overlap2=new Array[Int](R1,0 as Int);
	}
	
	public def setOverlap1(po:Point(2),s:Int){
		overlap1(po)=s;
	}
	public def setOverlap2(po:Point(2),s:Int){
		overlap2(po)=s;
	}
	
	public def getOverlap1():Array[Int]{
		return overlap1;
	}
	public def getOverlap2():Array[Int]{
		return overlap2;
	}
	
	
	
	
}