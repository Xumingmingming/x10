/*ϸ��1���������ܺ�������ͬ����java�п������У����������Դ�д��ĸ��Ϊ��ͷ��x10�в���,����ֱ������
 * 2.�������������2������2�����ϵ�Place�ϣ��������ִ���java.lang.Error: Unresolved compilation problems��*/
package globalArray;
public class BlockDistRail {
	protected val sz:Long; // block size
	protected val raw:PlaceLocalHandle[Rail[long]];
	public def this(sz:Long){long haszero} {
		this.sz = sz;
		raw = PlaceLocalHandle.make[Rail[long]](Place.places(), ()=>new Rail[long](sz));
	}
	public operator this(i:long) =(v:long){at(Place(i/sz)) raw()(i%sz)=v;} 
	public operator this(i:Long) = at(Place(i/sz)) raw()(i%sz);
	public static def main(Rail[String]) {
		val rail = new BlockDistRail(5); 
		rail(7)=8;
		for(i in 0..19){
			Console.OUT.println("rail="+rail+" rail("+i+")="+rail(i)+" ");
		}
		Console.OUT.println("rail(7)="+rail(7));
		/*Console.OUT.println("ѭ�����1��");
		for(i in 0..19){
			Console.OUT.println(rail.operator()(rail(i))+":rail("+i+")="+rail(i)+" ");
		}
		Console.OUT.println("ѭ�����2��");*/
		/*PlaceLocalHandle:public T operator()()Returns:the object mapped to the handle at the current place*/
		/*for(p in Place.places()){
			at(p){
				Console.OUT.println(rail.raw.operator()()+" raw():"+rail.raw());
				Console.OUT.println("rail.raw.operator()()(3)="+rail.raw.operator()()(3));
				Console.OUT.println("rail.raw.operator()()(2)="+rail.raw.operator()()(2));
			}
		}*/
}
}