package  
{
	import org.flixel.*;
	
	public class GameMath 
	{
		
		// Find the centers
		
		public static function CenterX( obj : FlxSprite ) : Number
		{
			return obj.x + obj.width / 2;
		}
		
		public static function CenterY( obj : FlxSprite ) : Number
		{
			return obj.y + obj.height / 2;
		}
		
		// Computes the predicted course of the ball.
		// Used by the AI for tracking ball position and moving to defend
		
		public static function ComputeEndpointY( obj : FlxSprite, x : Number ) : Number
		{
			var ratio : Number = (x - obj.x) / obj.velocity.x;
			
			return (obj.velocity.y * ratio) + obj.y;
		}
		
	}

}
