package Rail;
public class Rail_Arrays {
public static def main(Rail[String]){	
	val r1=new Rail[Double](5,1.0);
	val r2=new Rail[double](5,(i:long)=>5.0);
	val r3=[2,3,4,5,6];
	for(var i:Long=0;i<r1.size;i++){
		Console.OUT.println("Loop1 :"+"第"+i+"次"+r1(i));
	}
	for( j in 0..(r2.size-1)){
		Console.OUT.println("Loop2:"+"第"+j+"次"+r2(j));
	}
	for(v in r2.range()){
		Console.OUT.println("Loop3:"+"第"+v+"次"+r3(v));
	}
	/*for(k in r2){//k的初始值从1开始
		Console.OUT.println("Loop4:"+"第"+k+"次"+r2(k-1));
	}
	for(k in r2){
		Console.OUT.println("Loop4:"+"第"+k+"次"+r2(k));
	}*/
}
}
