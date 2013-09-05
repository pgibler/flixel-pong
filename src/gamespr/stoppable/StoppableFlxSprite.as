package gamespr.stoppable 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Paul Gibler
	 */
	public class StoppableFlxSprite extends FlxSprite implements Stoppable
	{
		
		public function StoppableFlxSprite(whileRunning:Function) 
		{
			onUpdate = whileRunning;
		}
		
		override public function update():void 
		{
			super.update();
			
			if(running && onUpdate != null)
			{
				onUpdate();
				
				lastVel.x = this.velocity.x;
				lastVel.y = this.velocity.y;
			}
		}
		
		private var onUpdate : Function;
		
		private var lastVel : FlxPoint = new FlxPoint();
		
		private var running : Boolean = true;
		public function Start():void
		{
			running = true;
			
			this.velocity.x = lastVel.x;
			this.velocity.y = lastVel.y;
			
			this.fixed = false;
		}
		public function Stop():void
		{
			running = false;
			
			this.velocity.x = 0;
			this.velocity.y = 0;
			
			this.fixed = true;
		}
	}

}