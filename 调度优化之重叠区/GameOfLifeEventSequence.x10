import x10.util.Random;
import x10.regionarray.DistArray;
import x10.regionarray.Region;
import x10.regionarray.Array;
import x10.regionarray.Dist;

public class GameOfLifeEventSequence {
	public var LiveCount:Long;
	public var LiveCountBorn:Long;
	public var LiveCountDead:Long;	
	//public val Reg:Region(2);	
	static val AgentList=DistArray.make[Agent](Dist.makeBlock(Region.make((0..(Grid.Grid_XMax-1)),(0..(Grid.Grid_YMax-1)))),(p:Point(2))=>null);
	static val overlap=PlaceLocalHandle.make[Cell[Overlap]](Place.places(),()=>new Cell[Overlap](new Overlap()));
	
	public def this()
	{
		LiveCount=0 as Long;
		LiveCountBorn=0 as Long;
		LiveCountDead=0 as Long;
		// Reg = Region.make((0..(Grid.Grid_XMax-1)),(0..(Grid.Grid_YMax-1)));
		// val D=Dist.makeBlock(Reg);
		// AgentList=DistArray.make[Agent](D,(p:Point(2))=>null);
		//tempArray=PlaceLocalHandle.make[Array[Int]](Place.places(),()=>new Array[Int](Region.make((0..(Grid.Grid_XMax-1)),(0..(Grid.Grid_YMax-1))),0n));
	}
	
	public def step1():void
	{
		init();
	}
	public def step2():void
	{
		AgentNeighborState();
		Interactive();		
	}
	public def step3():void
	{
		Display();
	}
	
	public  def init():void
	{
		  // val  R1 = Region.make(0..(overlap()().nOfoverlap-1), 0..(Grid.Grid_YMax-1)); 
		  // val doubleArray=new Array[long](R1,(p:Point(2)) =>0);
		finish for(p in Place.places()){
		 async at(p) {

		//Every place creates Agent.
		Console.OUT.println("Game of life is initializing in palce "+ here.id);	
		while(LiveCount<Setting.Agent_Quantity/AgentList.dist.numPlaces())//Return the number of the places of the Distarray
		{
			//nextDouble()返回0-1之间的double类型
			po:Point(2) = [((new Random().nextDouble()*Grid.Grid_XMax) as Int), 
			               ((new Random().nextDouble()*Grid.Grid_YMax) as Int)];	
			if(AgentList.dist.operator()(po)==here&&AgentList(po)==null)
			{
				AgentList(po)=new Agent(po,1 as Int);
				atomic LiveCount++;
				//Console.OUT.println("  "+ po +"(at Place"+ here.id +")");
			}  
		}
		Console.OUT.println("  "+"Now the number of agent is "+ LiveCount +" at Place "+ here.id +".");
		for(po in AgentList|here)
		{	
			if(AgentList(po)==null)
				{AgentList(po)=new Agent(po,0 as Int);}
		}
		setOverlap();
		}			
		}
		
	}

	public def AgentNeighborState()
	{	
		
		//Every Agent checks neighbor.
		for(po in AgentList|here)
		{
			var Neighbor:Array[Int]=new Array[Int](8,0 as Int);
			
			/*
			 * po(0)横坐标   po(1)纵坐标
			 * 3   4   5
			 * 2   po  6  
			 * 1   0   7  
			 */ 
			
			//如果point在block的边界
			//这里改了一下能跑通了
			if(po(0)==AgentList.dist.get(here).min(0)||po(0)==AgentList.dist.get(here).max(0)
					||po(1)==AgentList.dist.get(here).min(1)||po(1)==AgentList.dist.get(here).max(1)){
					//在block的左下角
				    if(po(0)==AgentList.dist.get(here).min(0)&&po(1)==AgentList.dist.get(here).min(1)){
						// Neighbor(2)= overlap()().getOverlap1()(0,po(1));
						// Neighbor(3)= overlap()().getOverlap1()(0,(po(1)+1));
						// Neighbor(4)= AgentList(po(0),(po(1)+1)).getState();
						// Neighbor(5)= AgentList((po(0)+1),(po(1)+1)).getState();
						// Neighbor(6)=  AgentList((po(0)+1),po(1)).getState();
					}
					/*在block的左上角*/
				    else if(po(0)==AgentList.dist.get(here).min(0)&&po(1)==AgentList.dist.get(here).max(1)){
						// Neighbor(0)=  AgentList(po(0),(po(1)-1)).getState();
						// Neighbor(1)=  overlap()().getOverlap1()(0,po(1));	
						// Neighbor(2)=  overlap()().getOverlap1()(0,(po(1)-1));
						// Neighbor(6)=  AgentList((po(0)+1),po(1)).getState();
						// Neighbor(7)=  AgentList((po(0)+1),(po(1)-1)).getState();
						}
				   //在block的右下角
				    else if(po(0)==AgentList.dist.get(here).max(0)&&po(1)==AgentList.dist.get(here).min(1)){
					   
					   // Neighbor(2)=  AgentList((po(0)-1),po(1)).getState();				
					   // Neighbor(3)=  AgentList((po(0)-1),(po(1)+1)).getState();
					   // Neighbor(4)=  AgentList(po(0),(po(1)+1)).getState();
					   // Neighbor(5)=  overlap()().getOverlap2()(0,(po(1)+1));
					   // Neighbor(6)=  overlap()().getOverlap2()(0,po(1));
				   }
				   /*在block的右上角*/
				    else if(po(0)==AgentList.dist.get(here).max(0)&&po(1)==AgentList.dist.get(here).max(1)){
					   // Neighbor(0)=  AgentList(po(0),(po(1)-1)).getState();
					   // Neighbor(1)=  AgentList((po(0)-1),(po(1)-1)).getState();					
					   // Neighbor(2)=  AgentList((po(0)-1),po(1)).getState();
					   // Neighbor(6)=  overlap()().getOverlap2()(0,po(1));
					   // Neighbor(7)=  overlap()().getOverlap2()(0,(po(1)-1));
				   }
               //在x轴下限
				    else if(po(0)==AgentList.dist.get(here).min(0)){			
				Neighbor(0)=  AgentList(po(0),(po(1)-1)).getState();				
				Neighbor(1)= overlap()().getOverlap1()(0,(po(1)-1)); 				
				Neighbor(2)= overlap()().getOverlap1()(0,po(1));
				Neighbor(3)= overlap()().getOverlap1()(0,(po(1)+1));
				Neighbor(4)= AgentList(po(0),(po(1)+1)).getState();
				Neighbor(5)= AgentList((po(0)+1),(po(1)+1)).getState();
				Neighbor(6)=  AgentList((po(0)+1),po(1)).getState();			
				Neighbor(7)=  AgentList((po(0)+1),(po(1)-1)).getState();		
				      					
				}
			  /*在x轴上限*/
				    else if(po(0)==AgentList.dist.get(here).max(0)){

					Neighbor(0)=  AgentList(po(0),(po(1)-1)).getState();
					
					Neighbor(1)=  AgentList((po(0)-1),(po(1)-1)).getState();
					
					Neighbor(2)=  AgentList((po(0)-1),po(1)).getState();
					
					Neighbor(3)=  AgentList((po(0)-1),(po(1)+1)).getState();

					Neighbor(4)=  AgentList(po(0),(po(1)+1)).getState();
					
					Neighbor(5)=  overlap()().getOverlap1()(0,(po(1)+1));
									
					Neighbor(6)=  overlap()().getOverlap1()(0,0);
					
					Neighbor(7)=  overlap()().getOverlap1()(0,(po(1)-1));					
					}
				/*在y轴下限*/
				    else if(po(1)==AgentList.dist.get(here).min(1)){
					
					Neighbor(2)=  AgentList((po(0)-1),po(1)).getState();
					
					Neighbor(3)=  AgentList((po(0)-1),(po(1)+1)).getState();

					Neighbor(4)=  AgentList(po(0),(po(1)+1)).getState();
					
					Neighbor(5)=  AgentList((po(0)+1),(po(1)+1)).getState();
					
					Neighbor(6)=  AgentList((po(0)+1),po(1)).getState();
					
				}
				/*在y轴上限*/
				    else if(po(1)==AgentList.dist.get(here).max(1)){
					Neighbor(0)=  AgentList(po(0),(po(1)-1)).getState();
					
					Neighbor(1)=  AgentList((po(0)-1),(po(1)-1)).getState();
					
					Neighbor(2)=  AgentList((po(0)-1),po(1)).getState();					
					
					Neighbor(6)=  AgentList((po(0)+1),po(1)).getState();
					
					Neighbor(7)=  AgentList((po(0)+1),(po(1)-1)).getState();
				}
			}
			/*
			 * po(0)横坐标   po(1)纵坐标
			 * 3   4   5
			 * 2   po  6  
			 * 1   0   7  
			 */ 
			else{
				//Console.OUT.println("跑到了AgentNeighborState---4");
						
            Neighbor(0)=  AgentList(po(0),(po(1)-1)).getState();
			
			Neighbor(1)=  AgentList((po(0)-1),(po(1)-1)).getState();
			
			Neighbor(2)=  AgentList((po(0)-1),po(1)).getState();
			
			Neighbor(3)=  AgentList((po(0)-1),(po(1)+1)).getState();

			Neighbor(4)=  AgentList(po(0),(po(1)+1)).getState();
			
			Neighbor(5)=  AgentList((po(0)+1),(po(1)+1)).getState();
		    
			Neighbor(6)=  AgentList((po(0)+1),po(1)).getState();
			
			Neighbor(7)=  AgentList((po(0)+1),(po(1)-1)).getState();
			
			}
			
			AgentList(po).setNeighbors(Neighbor);
			
		}
		
	}
	
	public def Interactive()
	{	
		//Every Agent Interactives.
		LiveCountBorn = 0;
		LiveCountDead = 0;
		Console.OUT.println("Interactiving in Place " + here.id);
		for(po in AgentList|here)
		{ 
			var AgentState:Int;
			var NeighborInteractive:Array[Int]=new Array[Int](8,0 as Int);
			var NeighborLiveCount:Int=0 as Int;//NeighborLiveCount should set inside the loop in case of successive incrementing.
			AgentState=AgentList(po).getState() as Int;
			NeighborInteractive=AgentList(po).getNeighbors();
			
			for(j in NeighborInteractive)
			{
				if(NeighborInteractive(j)==1 as Int)
					atomic NeighborLiveCount++;
			}
			
			if(NeighborLiveCount<2 as Int && AgentState!=0 as Int)
			{
				AgentState=0 as Int;
				atomic LiveCountDead-=1;
			}
			
			//if(NeighborLiveCount==2 as Int)
			// ״̬�㶨�������ж�
			
			if(NeighborLiveCount==3 as Int && AgentState!=1 as Int)
			{
				AgentState=1 as Int;
				atomic LiveCountBorn+=1;
			}
			
			if(NeighborLiveCount>3 as Int && AgentState!=0 as Int)
			{
				AgentState=0 as Int;
				atomic  LiveCountDead-=1;
			}
			
			AgentList(po).setState(AgentState);
			
		}
		Console.OUT.println("  "+"The number of Born Agent (after interactive) is "+ LiveCountBorn +" at Place "+ here.id +".");
		Console.OUT.println("  "+"The number of Dead Agent (after interactive) is "+ LiveCountDead +" at Place "+ here.id +".");			
	}
	
	public def Display()
	{
		var LiveCount:Int=0 as Int;
		Console.OUT.println("  "+"Display in Place("+ here.id +")");	
		for(po in AgentList|here)
		{
			if(AgentList(po).getState()==1n)
			{
				LiveCount++;
				Console.OUT.println("  "+ AgentList(po).getLocation());	
			}		
		}
		Console.OUT.println("  "+"The number of Agent (StepEnd) is "+ LiveCount +" in Place "+ here.id );
	}
	public static def setOverlap(){
		//place0只传一个重叠区
		if(Place(0)==here){
			for (var i:long=0; i<Overlap.nOfoverlap; i++) {
				for (var j:long=0; j<Grid.Grid_YMax; j++) {
					val x=i+AgentList.dist.get(Place.places().next(here)).min(0);
					val y=j;
					overlap()().setOverlap2([i,j],at(AgentList.dist.operator()(x,y)) AgentList(x,y).getState() );
				}
			}
		}
		//最后一个place也只传一个重叠区
		else if(Place(Place.numPlaces()-1)==here){
			for (var i:long=0; i<Overlap.nOfoverlap; i++) {
				for (var j:long=0; j<Grid.Grid_YMax; j++) {
					val x=AgentList.dist.get(Place.places().prev(here)).max(0)-Overlap.nOfoverlap+i;
					val y=j;
					overlap()().setOverlap1([i,j],at(AgentList.dist.operator()(x,y)) AgentList(x,y).getState()  );
				}
			}
		}
		//place0和最后place直接的place
		else{
			//下面的重叠区
			for (var i:long=0; i<Overlap.nOfoverlap; i++) {
				for (var j:long=0; j<Grid.Grid_YMax; j++) {
					val x=i+AgentList.dist.get(Place.places().next(here)).min(0);
					val y=j;
					overlap()().setOverlap2([i,j],at(AgentList.dist.operator()(x,y)) AgentList(x,y).getState()  );
				}
			}
			//上面的重叠区
			for (var i:long=0; i<Overlap.nOfoverlap; i++) {
				for (var j:long=0; j<Grid.Grid_YMax; j++) {
					val x=AgentList.dist.get(Place.places().prev(here)).max(0)-Overlap.nOfoverlap+i;
					val y=j;
					overlap()().setOverlap1([i,j],at(AgentList.dist.operator()(x,y)) AgentList(x,y).getState() as Int  );
				}
			}
			
		}
		
	}
	
}
