/*���ڶ�place��ʹ��globalRef����static������static�����ڷ������ڣ�������ᱨ��x10.lang.FailedDynamicCheckException: !(here == t$148659.home)
 */
package globalRef;
public class Test_globalRef {
	static val result=GlobalRef[Rail[long]](new Rail[Long](4,(i:Long)=>i+here.id));
	public static def main(Rail[String]) {
		// val result=GlobalRef[Rail[long]](new Rail[Long](0));
		//var num:Int=0n;
		/* finish for(p in Place.places()) at(p)
		 * async{
		 * at(result) atomic {
		 * // result()()=here.id;
		 * Console.OUT.println(here+"  "+"result= "+result+"  "+"result()= "+result()+"result()()= "+result()(3));
		 * }
		 * }
		 * Console.OUT.println(result);*/
		val result2=GlobalRef[Rail[long]](new Rail[Long](4,(i:Long)=>i+here.id));
		Console.OUT.println("��PlaceLocalHandle�Ƚϣ�");
		Console.OUT.println("static GlobalRef��");
		Console.OUT.println("��forѭ�����棺");
		finish{	for(p in Place.places()) 
			at(p) {
			Console.OUT.println(here+"  "+"result= "+result+"  "+"result()= "+result()+"  "+"result()(3)= "+result()(3));
			Console.OUT.println(here);
			Console.OUT.print(result()(0)+" ");
			Console.OUT.print(result()(1)+" ");
			Console.OUT.print(result()(2)+" ");
			Console.OUT.println(result()(3)+" ");
		}
		}
		Console.OUT.println("��forѭ�����棺");
		Console.OUT.println(here);
		Console.OUT.print(result()(0)+" ");
		Console.OUT.print(result()(1)+" ");
		Console.OUT.print(result()(2)+" ");
		Console.OUT.println(result()(3)+" ");
		Console.OUT.println("�ֲ�globalRef");
	    /*finish{	for(p in Place.places()) 
			at(p) {
			Console.OUT.println(here+"  "+"result2= "+result2+"  "+"result2()= "+result2()+"result2()(3)= "+result2()(3));
			Console.OUT.println("�����棺");
			Console.OUT.println(here);
			Console.OUT.print(result2()(0)+" ");
			Console.OUT.print(result2()(1)+" ");
			Console.OUT.print(result2()(2)+" ");
			Console.OUT.println(result2()(3)+" ");
		}
		}*/
		Console.OUT.println("�����棺");
		Console.OUT.println(here);
		Console.OUT.print(result2()(0)+" ");
		Console.OUT.print(result2()(1)+" ");
		Console.OUT.print(result2()(2)+" ");
		Console.OUT.println(result2()(3)+" ");
			}
}