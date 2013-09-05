package gamespr 
{
	import org.flixel.*;
	
	public class HumanPlayer extends Player
	{
		
		public function HumanPlayer(state : FlxState, goal:FlxSprite, paddle:Paddle, textBox:FlxText)  
		{
			super(whileRunning, state, goal, paddle, textBox);
		}
		
		private function whileRunning():void 
		{			
			if (FlxG.keys.W)
			{
				PlayerPaddle.Up();
			}
			
			if (FlxG.keys.S)
			{
				PlayerPaddle.Down();
			}
		}
		
	}

}