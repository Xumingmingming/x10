/*ʵ��֤��PlaceLocalHandle�����ò���static��������ʵ����ͬ�Ĺ���*/
package plh;
public class My_Test_PLH {
	//static val c =PlaceLocalHandle.make[Cell[Long]](Place.places(), ()=>new Cell[Long](-1));
	static val raw1 = PlaceLocalHandle.make[Rail[Long]](Place.places(), ()=>new Rail[long](4,(i:Long)=>i+here.id));
	//static val result=GlobalRef[Rail[long]](new Rail[Long](4,(i:Long)=>i+here.id));
    public static def main(args: Rail[String]) {
        // TODO auto-generated stub
    	val plh=new My_Test_PLH();
        val raw2 = PlaceLocalHandle.make[Rail[Long]](Place.places(), ()=>new Rail[long](4,(i:Long)=>i+here.id));
        Console.OUT.println("static����PlaceLocalHandle��");
    finish{	for(p in Place.places()) 
    		at(p) {
    		Console.OUT.println(here+" "+"raw= "+raw1+" raw()="+raw1());
    		Console.OUT.println(here);
    		Console.OUT.print(raw1()(0)+" ");
    		Console.OUT.print(raw1()(1)+" ");
    		Console.OUT.print(raw1()(2)+" ");
    		Console.OUT.println(raw1()(3)+" ");
    		}
    }
        Console.OUT.println("�����棺");
        Console.OUT.println(here);
    	Console.OUT.print(raw1()(0)+" ");
    	Console.OUT.print(raw1()(1)+" ");
    	Console.OUT.print(raw1()(2)+" ");
    	Console.OUT.println(raw1()(3)+" ");
   
    Console.OUT.println("�ֲ�����PlaceLocalHandle��");
    Console.OUT.println("��forѭ�����棺");
    finish{	for(p in Place.places()) 
    at(p) {
    Console.OUT.println(here+" "+"raw2= "+raw2+" raw2()="+raw2());
    
    Console.OUT.print(raw2()(0)+" ");
    Console.OUT.print(raw2()(1)+" ");
    Console.OUT.print(raw2()(2)+" ");
    Console.OUT.println(raw2()(3)+" ");
    }
    }
    Console.OUT.println("��.PLH��");
    finish{	for(p in Place.places()) 
    	at(p) {
    	Console.OUT.println(here+" "+"raw2= "+raw2+" raw2()="+raw2());
    	
    	Console.OUT.print(raw2()(0)+" ");
    	Console.OUT.print(raw2()(1)+" ");
    	Console.OUT.print(raw2()(2)+" ");
    	Console.OUT.println(raw2()(3)+" ");
    }
    }
    Console.OUT.print("��forѭ�����棺 ");
    Console.OUT.print(raw2()(0)+" ");
    Console.OUT.print(raw2()(1)+" ");
    Console.OUT.print(raw2()(2)+" ");
    Console.OUT.println(raw2()(3)+" ");
    
    //�޷�ֱ��at�� PlaceLocalHandle������
    /* finish for(p in Place.places()){
    	async at(raw){
    		
    	}
    } */
   /* Console.OUT.println("���÷�2�� ");
    for(p in Place.places()) at(p) {
    	
    	for(i in 0..3){
    		Console.OUT.println(plh.raw.operator()());
    		Console.OUT.println("local000000000000 Place"+here.id + " " + plh.raw.operator()().operator()(i)+" $$ "+raw);
    	}
    }
    	Console.OUT.println("other:");
    	at(Place.places().next(here)){
    	Console.OUT.println(here);
    	Console.OUT.print(raw()(0)+" ");
    	Console.OUT.print(raw()(1)+" ");
    	Console.OUT.print(raw()(2)+" ");
    	Console.OUT.print(raw()(3)+" ");
    	}*/
     }
}