package function;

public class Test_globalArray {
	// public static def test_globalArray(i:long){
	// 	val rail=new ImplementsFunToClass(i);
	// 	var p:long=0;
	// 	for(num in 0..(i-1)){rail(i)=-1;}
	// 	Console.OUT.println("第"+i+":");
	// 	for(num in 0..(i-1)){
	// 		Console.OUT.print("rail("+i+")="+rail(i)+" ");
	// 		p++;
	// 		if(p>=50){
	// 			p=0;
	// 			Console.OUT.println('\t');
	// 		}
	// 	}
	// 	Console.OUT.print('\r');
	// }
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	// for(p in 10..300){
    	// 	test_globalArray(p);
    	// }
    	// val rail1 = new ImplementsFunToClass(20);
    	// for(i in 0..19){rail1(i)=i;}
    	//  for(i in 0..19){Console.OUT.println("rail1("+i+")="+rail1(i));}
    	//  val rail2 =new ImplementsFunToClass(19);
    	//  for(i in 0..18){rail2(i)=-1;}
    	//  for(i in 0..18){Console.OUT.println("rail2("+i+")="+rail2(i));}
    	val rail3 =new ImplementsFunToClass(10000);
    	var p:long=0;
    	for(i in 0..9999){rail3(i)=i;}
    	 for(i in 0..9999){
     		 	Console.OUT.print("rail("+i+")="+rail3(i)+" ");
    		 		p++;
    		 		if(p>=50){
    		 			p=0;
    		 			Console.OUT.println('\t');
    		 		}  		 	
    		 }
    	 Console.OUT.println("真高兴呀真高兴！！！");
    }
}