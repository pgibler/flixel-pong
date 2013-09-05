package gamespr
{
	import gamespr.stoppable.StoppableFlxSprite;
	import org.flixel.FlxSprite;
	
	public class Paddle extends StoppableFlxSprite
	{
		public function TryBounce(ball:Ball):void { }
		public function Up():void {	}
		public function Down():void {	}
		
		public function Paddle(whileRunning:Function):void
		{
			super(whileRunning);
		}
	}

}