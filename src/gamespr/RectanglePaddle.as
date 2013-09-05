package gamespr 
{
	import flash.display.BitmapData;
	import org.flixel.*;
	
	public class RectanglePaddle extends Paddle
	{
		public function RectanglePaddle(x : Number, y : Number, width : Number, height : Number) 
		{
			super( null );
			
			var paddle : BitmapData = new BitmapData(width, height, false, 0xFF55FF);
			
			this.x = x;
			this.y = y;
			this.pixels = paddle;
			this.fixed = true;
		}
		
		public override function TryBounce(ball:Ball):void
		{
			// Get reference to "this" object now as Actionscript 'this' references are scoped in functions like JS 'this' references.
			var thiz : RectanglePaddle = this;
			
			if (FlxU.collide(this, ball))
			{
				// Add 1 to the y-velocity for each pixel the ball hits the paddle away from the paddle's y-center
				ball.velocity.y += GameMath.CenterY( ball ) - GameMath.CenterY( this );
			}
		}
		
		private var ySpeed : Number = 3;
		
		public override function Up():void
		{
			if (y > 0)
			{
				y -= ySpeed;
			}
		}
		
		public override function Down():void
		{
			if (y < FlxG.height - height)
			{
				y += ySpeed;
			}
		}
	}

}