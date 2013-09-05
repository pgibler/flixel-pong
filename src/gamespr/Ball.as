package gamespr
{
	import flash.display.BitmapData;
	import gamespr.stoppable.StoppableFlxSprite;
	import org.flixel.*;
	
	public class Ball extends StoppableFlxSprite
	{
		
		public function Ball() 
		{
			super(whileRunning);
			
			var bm : BitmapData = new BitmapData(5, 5, false, 0xFF00FF);
			
			pixels = bm;
			
			Reset();
			
			GObj.Instance.GetBalls().push( this );
		}
		
		private function whileRunning():void 
		{
			if (y > FlxG.height - height)
			{
				y = FlxG.height - height;
				velocity.y *= -1;
			}
			else if ( y < 0 )
			{
				y = 0;
				velocity.y *= -1;
			}
			
			if (x > FlxG.width || x < -width)
			{
				Reset();
			}
		}
		
		public function Reset():void
		{
			var variableXSpeed : Number = 30;
			var baseXSpeed : Number = 300;
			var variableYSpeed : Number = 50;
			
			velocity.x = Math.random() > .5 ? Math.random() * variableXSpeed + baseXSpeed : -Math.random() * variableXSpeed - baseXSpeed;
			velocity.y = -70// (Math.random() - .5) * variableYSpeed;
			
			x = FlxG.width / 2;
			y = FlxG.height / 2;
		}
		
		override public function hitBottom(Contact:FlxObject, Velocity:Number):void 
		{
			super.hitBottom(this, this.velocity.y *= -1);
		}
		
		override public function hitTop(Contact:FlxObject, Velocity:Number):void 
		{
			super.hitTop(this, this.velocity.y *= -1);
		}
		
		override public function hitLeft(Contact:FlxObject, Velocity:Number):void 
		{
			super.hitLeft(this, this.velocity.x *= -1);
		}
		
		override public function hitRight(Contact:FlxObject, Velocity:Number):void 
		{
			super.hitRight(this, this.velocity.x *= -1);
		}
	}

}