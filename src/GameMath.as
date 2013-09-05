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
		
		public static function ComputeEndpointY( obj : FlxSprite, x : Number ) : Number
		{
			var ratio : Number = (x - obj.x) / obj.velocity.x;
			
			//trace(x, obj.x, obj.y, ratio);
			
			return (obj.velocity.y * ratio) + obj.y;
		}
		
	}

}