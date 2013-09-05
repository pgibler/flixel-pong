package gamespr 
{
	import flash.display.BitmapData;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Paul Gibler
	 */
	public class RectangleGoal extends FlxSprite
	{
		
		public function RectangleGoal(x : Number, y : Number, width : Number, height : Number) 
		{
			var goal : BitmapData = new BitmapData(width, height, false, 0xFF33FF);
			
			this.x = x;
			this.y = y;
			this.pixels = goal;
			this.solid = true;
		}
		
	}

}