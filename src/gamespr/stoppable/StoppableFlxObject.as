package gamespr.stoppable 
{
	import org.flixel.FlxObject;
	/**
	 * ...
	 * @author Paul Gibler
	 */
	public class StoppableFlxObject extends FlxObject implements Stoppable
	{
		
		public function StoppableFlxObject(whileRunning:Function) 
		{
			onUpdate = whileRunning;
		}
		
		override public function update():void 
		{
			super.update();
			
			if(running && onUpdate != null)
			{
				onUpdate();
			}			
		}
		
		private var onUpdate : Function;
		
		private var running : Boolean = true;
		public function Start():void { running = true; }
		public function Stop():void { running = false; }
	}

}