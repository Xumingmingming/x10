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
    	Console.OUT.print("DistArray1�����Places:");
    	Console.OUT.println(DistArray1.dist.places());
    	Console.OUT.print("DistArray1�����Places����:");
    	Console.OUT.println(DistArray1.dist.numPlaces());
    	Console.OUT.println("Block:"+Block);
    	Console.OUT.println("Block2:"+Block2);
    	Console.OUT.println("Block3:"+Block3);
    	//DistArrayһά
    	finish for(p in DistArray1.dist.places()){
    		async at(p){ 
    			for(point in DistArray1|here){
    			Console.OUT.println(here+":"+DistArray1(point));
    			}
    	               }
    		}*/
    	//DistArray,blockһ��
    	//��DistArray�ڸ�Place������ηֲ��İ��л��ǰ��У�
    	Console.OUT.println("��ά�ֲ�ʽ����:");
    	val BBlock=Dist.makeBlock(Region.make(0..5,0..5));
    	val DistArray2=DistArray.make[long](BBlock,(p:Point(2)) =>p(0)*p(1));
    	Console.OUT.println(here+":"+[0,0]);
    	Console.OUT.println(here+":"+"DistArray2(0,0):"+DistArray2(0,0));
    	Console.OUT.println("BBlock:"+BBlock);
    	Console.OUT.println("�ֲ�ʽ����ѭ��������");
    	finish for(p in DistArray2.dist.places()){
    		async at(p){ 
    			for(point in DistArray2|here){
    				Console.OUT.println(here+":"+point+"="+DistArray2(point));
    			}
    		}
    	}
    	// Console.OUT.println("���ԣ�");
    	// finish for(q in DistArray2.dist.places()){
    	// 	async at(q){
    	// 		for(point in DistArray2|here){
    	// 			p:Point(2)=[(here.id as Int),((here.id+1) as Int)];
    	// 			Console.OUT.println(here+":"+point+"="+DistArray2(point));
    	// 		}
    	// 	}
    	// }
    	//BlockBlock2��
    	//����block�����ص���Dist����
    	val bblock=Dist.makeBlockBlock(Region.make(0..2,0..3));
    	//DistArray������ʼ��
    	//p(0)�����У�p(1)������
    	val distArray3=DistArray.make[Long](bblock,(p:Point(2)) =>p(0)*p(1));
    	Console.OUT.println("����makeBlockBlock��");
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