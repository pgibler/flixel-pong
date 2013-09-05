package 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Paul Gibler
	 */
	public class MenuState extends FlxState 
	{
		
		public function  MenuState():void 
		{
			add(new FlxText(0, FlxG.height / 2, FlxG.width, 'New Flixel Project').setFormat(null, 16,0xffffff,'center'));
			add(new FlxText(0, (FlxG.height / 2) + 18, FlxG.width, 'Press X to go to the PlayState').setFormat(null, 8,0x6600cc,'center'));
		}
		
		override public function update():void
		{
			if(FlxG.keys.justPressed("X"))
				FlxG.state = new PlayState();
		}
		
	}
	
}