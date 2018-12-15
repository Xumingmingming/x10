

import x10.regionarray.Array;
/**
 * It should be a single instance, that is there is only one ScheduleRunner in every model.
 * But how to impement this?
 */
public class ScheduleRunner {
	/**
	 * @ parameter: go-----------------Decide whether to continue for this simulating.
	 * 
	 * @ parameter: schedule-----------????
	 * 
	 * @ parameter: globalNextTick-----The global tick for next.
	 * @ parameter: localNextTick------The local tick for next.
	 * @ parameter: endEvent-----------The end event for schedule.
	 */
	private var go: boolean;
	//private var schedule: Schedule;
	private var globalNextTick: double, localNextTick: double,tempTick:double;
	private var stopTick: double;
	private var endEvents: Functor;
	static private val currentTick=new Array[double](Place.numPlaces(),0);
	static val plh=PlaceLocalHandle.make[Cell[Schedule]](Place.places(),()=>new Cell[Schedule](new Schedule()));
	static val time=PlaceLocalHandle.make[Cell[Double]](Place.places(),()=>new Cell[Double](0));
	static val numOfIteration=PlaceLocalHandle.make[Cell[Int]](Place.places(),()=>new Cell[Int](Overlap.nOfoverlap));
	private var times: int;
	public def this(){
		go = true;
		globalNextTick = 0.0;
		localNextTick = 0.0;
		stopTick = -1.0 as double;
		//schedule = new Schedule();              //this need parrall
		times=0n;
		endEvents = null;
      // numOfIteration=Overlap.nOfoverlap;
	}
	
	/**
	 * Construct with parameter of endEvents.
	 * Pass the event(functor) which is the end event to be scheduled.
	 */
	public def this(endEvents: Functor){
		go = true;
		globalNextTick = 0.0;
		localNextTick = 0.0;
		stopTick = -1.0 as double;
		//schedule = new Schedule();
		this.endEvents = endEvents;
	}
	
	/**
	 * This is right or wrong to implement single instance.
	 * Not USE!
	 */
	public static def getInstance():ScheduleRunner{
		return new ScheduleRunner();
	}
	
	/**
	 * Schedule the OneTimeEvent which will invoke the schedule's schedule_event.
	 * In fact, it is push the event into queue of schedule firstly.
	 * 
	 */
	public def scheduleEvent(start:double, fun:Functor):void{
     finish for(p in Place.places())
	{
	
	  at(p) async
	  {
		//var event: ScheduledEvent = plh()().schedule_event(start, fun);
		plh()().schedule_event(start, fun);
		//nextTick();
		}
		}
		//return event;
	}
	
	
	/**
	 * Schedule the RepeatingEvent which will invoke the schedule's schedule_event.
	 * In fact, it is push the event into queue of schedule firstly.
	 * 
	 */
	public def scheduleEvent(start:double, interval:double, fun:Functor):void{
		
		
      finish for(p in Place.places())
		{
			
			at(p) async
			{
				//var event: ScheduledEvent = plh()().schedule_event(start, fun);
				plh()().schedule_event(start, interval, fun);
				//Console.OUT.println(here.id+"�¼���ֵ�׶�");
				//nextTick();
			}
		}
		
	}
	/**
	 * OneTimeEvent, but this will end the simulation.
	 */
	public def scheduleStopEvent(start:double, fun:Functor):void{
	
		
     finish for(p in Place.places())
		{
			
			at(p)  async
			{
				//var event: ScheduledEvent = plh()().schedule_event(start, fun);
				plh()().schedule_stop_event(start, fun);
				//nextTick();
			}
		}
	}
	
	/**
	 * Schedule the end event.
	 * Which object's fun ?
	 */
	public def scheduleEndEvent(start:double, fun: Functor):void{
		/**
		 * endEvents.push(fun);
		 */
	}
	
	/**
	 * This is wrong, because there maybe no such tick in schedule.
	 * So that, the simulation can't stop as expected!
	 * 
	 * The correct method is wrapped this as a StopEvent, and push it in the schedule.
	 */
	public def scheduleStop(stopAt:double):void{
		stopTick = stopAt;
	}
	/**
	 * This is a Schedule written in the style of 
	 * RepastHPC's synchronization algorithm (conservative strategy)
	 * 
	 * Right!!
	 */
	public def run():void{	
		var runoftime:Long = -System.nanoTime();
		while(true){
			for(var n:int=0n;n<Overlap.nOfoverlap;n++){
			    	
	  /*各个LP向中心LP（实际上就是place0）报告本地Schedule中优先级最高的tick值*/
		finish for(q in Place.places())
		 { 
				async {currentTick(q.id)= at(q) plh()().getNextTick();}
		 }
		//得到全局最小tick
		globalNextTick=currentTick(0);
		for(i in 1..(Place.numPlaces()-1)){
			if(globalNextTick>currentTick(i)){
				globalNextTick=currentTick(i);
			}
		}
		//中心LP中的Schedule向各LP中的schedule广播全局最小tick
		finish for(p in Place.places())
		{ 
			at(p) async 
			plh()().setGlobalTick(globalNextTick);
		}
		//各LP的Schedule以全局最小tick为基准，调度事件
		finish for(p in Place.places())
			{at(p) async
			{							  
						 if(plh()().getNextTick()<=plh()().getGlobalTick())
						  {
							 plh()().execute();
						  }
			}
			}
		
			if(plh()().getNextTick()==-1.0){
				runoftime+= System.nanoTime();
				runoftime/= 1000000;//以毫秒形式输出
				Console.OUT.println("\n" +"" +"  schedule Total time consuming is " +runoftime +"ms.");
				return;
				}
				}
			GameOfLifeEventSequence.setOverlap();
		}
		}

	
/*	public def getCurrentTick():double{
		return schedule.getCurrentTick();
	}*/
	
	/**
	 * Stop the simulating.
	 */
	public def stop():void{
		go = false;
		
		//Console.OUT.println("�˿̵�go��Ϊ��false");
		
	}
	
	/*public def getSchedule():Schedule{
		return schedule;
	}*/
	
	/**
	 * Get the next tick to be schedule at.
	 */
	public def nextTick():void{
		localNextTick = plh()().getNextTick();
	}
	public def judgego():boolean
	{
	   return go;
	   
	      
	}
	
}