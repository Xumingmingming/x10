package test_Array;
import x10.regionarray.Array;
import x10.array.Array_2;
import x10.regionarray.Region;
public class Test_Array {
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	val N:long =5;
    	val a = new Array[long](5,(i:long)=>i+1);//一维Array
    	Console.OUT.println("一维数组a：");
    	for(i in a){
    		Console.OUT.println("a数组的值:"+a(i));
    	}
    	val b = new Array[double](3,3.0);
    	Console.OUT.println("一维数组b：");
    	for(var i:long=0;i<b.size;i++){
    		Console.OUT.println("b数组的值:"+b(i));
    	}
    	//多维Array如何实现？
    	val array1 = new Array_2[Double](N, N, (i:long,j:long)=>(i*j) as double);
    	val array2= new Array_2[Long](N, N, (i:long,j:long)=>(i-j) as long);//基本类型首字母大小写不分
    	Console.OUT.println("多维数组array1迭代表示法1：");
    	for (var i:long=0; i<array1.numElems_1; i++) {
    		for (var j:long=0; j<array1.numElems_2; j++) {
    			Console.OUT.println("("+i+","+j+")="+array1(i,j));
    		}
    	}
    	Console.OUT.println("多维数组array1迭代表示法2");//逐行输出
    	for (v in array1) {
    		Console.OUT.println(v);
    	}
    	Console.OUT.println("数组2：");
    	for (v in array2) {
    		Console.OUT.println(v);
    	}
    	val  R1 = Region.make(0..9, 0..9); 
    	val array=new Array(R1,(p:Point(2)) =>p(0)*p(1));//乘法表
    	Console.OUT.print("Array和Point结合：");
    	for (p in array) {
    		Console.OUT.print(p+":");
    		Console.OUT.println(array(p));
    	}
    }
}