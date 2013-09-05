package gamespr 
{
	import org.flixel.*;
	
	public class ComputerPlayer extends Player
	{
		
		public function ComputerPlayer(state : FlxState, goal:FlxSprite, paddle:Paddle, textBox:FlxText)  
		{
			super(whileRunning, state, goal, paddle, textBox);
		}
		
		private function whileRunning():void 
		{
			var ball : Ball = GetClosestApproachingBall( GObj.Instance.GetBalls() );
			
			if (ball != null)
			{
				MoveTo(ball);
			}
		}
		
		// Returns the closest ball, or null if none are found or none are approaching.
		private function GetClosestApproachingBall( balls : Vector.<Ball> ) : Ball
		{
			var closest : Ball = null;
			var closestDistance : Number;
			var currentDistance : Number;
			
			for each(var ball : Ball in balls)
			{
				if (IsApproaching(ball))
				{
					currentDistance = GetDistance( ball, Goal );
					
					// We have to set closest if its null, since we found an approaching one.
					// Otherwise, check to see if the current one is closer than closest.
					if (currentDistance < closestDistance || closest == null)
					{
						closestDistance = currentDistance;
						closest = ball;
					}
				}
			}
			
			return closest;
		}
		
		private function IsApproaching(ball:Ball):Boolean
		{
			var istrue : Boolean = (ball.velocity.x > 0 && Goal.x > ball.x) ||
					(ball.velocity.x < 0 && Goal.x < ball.x);
					trace(ball.velocity.x, Goal.x, ball.x, istrue);
			return 	istrue;
		}
		
		private const CenteringOffset : Number = 20;
		
		private function MoveTo( ball : Ball ) : void
		{
			var finalY : Number = GameMath.ComputeEndpointY( ball, Goal.x );
			
			// Super ez AI
			if (finalY > GameMath.CenterY( PlayerPaddle ) + CenteringOffset)
			{
				PlayerPaddle.Down();
			}
			else if (finalY < GameMath.CenterY( PlayerPaddle ) - CenteringOffset)
			{
				PlayerPaddle.Up();
			}
		}
		
		private function GetDistance(spr1:FlxSprite, spr2:FlxSprite):Number
		{
			return spr1.x - spr2.x;
		}
	}
}