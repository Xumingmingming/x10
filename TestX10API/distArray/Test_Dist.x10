/*Note that Arrays are constructed by constructor calls, but DistArrays are constructed
by calls to the factory methods DistArray.make.*/
package distArray;
import x10.regionarray.Dist;
import x10.regionarray.Region;
import x10.regionarray.DistArray;
public class Test_Dist {
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    /*	val Block=Dist.makeBlock(Region.make(0..9));
    	val Block2=Dist.makeBlock(Region.make(0..10));
    	val Block3=Dist.makeBlock(Region.make(0..11));
    	val DistArray1=DistArray.make[long](Block,([i]:Point) => i);
    	Console.OUT.print("DistArray1分配的Places:");
    	Console.OUT.println(DistArray1.dist.places());
    	Console.OUT.print("DistArray1分配的Places个数:");
    	Console.OUT.println(DistArray1.dist.numPlaces());
    	Console.OUT.println("Block:"+Block);
    	Console.OUT.println("Block2:"+Block2);
    	Console.OUT.println("Block3:"+Block3);
    	//DistArray一维
    	finish for(p in DistArray1.dist.places()){
    		async at(p){ 
    			for(point in DistArray1|here){
    			Console.OUT.println(here+":"+DistArray1(point));
    			}
    	               }
    		}*/
    	//DistArray,block一次
    	//在DistArray在各Place中是如何分布的按行还是按列？
    	Console.OUT.println("二维分布式数组:");
    	val BBlock=Dist.makeBlock(Region.make(0..5,0..5));
    	val DistArray2=DistArray.make[long](BBlock,(p:Point(2)) =>p(0)*p(1));
    	Console.OUT.println(here+":"+[0,0]);
    	Console.OUT.println(here+":"+"DistArray2(0,0):"+DistArray2(0,0));
    	Console.OUT.println("BBlock:"+BBlock);
    	Console.OUT.println("分布式数组循环迭代：");
    	finish for(p in DistArray2.dist.places()){
    		async at(p){ 
    			for(point in DistArray2|here){
    				Console.OUT.println(here+":"+point+"="+DistArray2(point));
    			}
    		}
    	}
    	// Console.OUT.println("测试：");
    	// finish for(q in DistArray2.dist.places()){
    	// 	async at(q){
    	// 		for(point in DistArray2|here){
    	// 			p:Point(2)=[(here.id as Int),((here.id+1) as Int)];
    	// 			Console.OUT.println(here+":"+point+"="+DistArray2(point));
    	// 		}
    	// 	}
    	// }
    	//BlockBlock2次
    	//申请block，返回的是Dist类型
    	val bblock=Dist.makeBlockBlock(Region.make(0..2,0..3));
    	//DistArray变量初始化
    	//p(0)代表行，p(1)代表列
    	val distArray3=DistArray.make[Long](bblock,(p:Point(2)) =>p(0)*p(1));
    	Console.OUT.println("测试makeBlockBlock：");
    	Console.OUT.println("bblock:"+bblock);  	
    	finish for(p in distArray3.dist.places()){
                at(p){
    			Console.OUT.println("this is "+here);
    			for(point in distArray3|here ){
    				Console.OUT.print(point+"="+distArray3(point)+" ");
    			}
    			Console.OUT.print("\n");
    		}
    	}
    }
}