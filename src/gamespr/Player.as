package gamespr
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import gamespr.stoppable.StoppableFlxObject;
	import org.flixel.*
	
	public class Player extends StoppableFlxObject
	{
		private var textBox : FlxText;
		
		private var goal : FlxSprite
		
		public function get Goal():FlxSprite { return goal; }
		
		private var paddle : Paddle;
		
		public function get PlayerPaddle() : Paddle { return paddle; }
		public function set PlayerPaddle(paddle:Paddle):void { this.paddle = paddle; }
		
		private static var playerNumber : Number = 0;
		private var number : Number;
		
		public function get PlayerNumber() : Number { return this.number; }
		
		public function Player(whileRunning : Function, state : FlxState, goal:FlxSprite, paddle:Paddle, textBox:FlxText) 
		{
			super(whileRunning);
			
			this.goal = goal;
			this.wins = 0;
			this.paddle = paddle;
			this.textBox = textBox;
			this.number = ++playerNumber;
			
			state.add(goal);
			state.add(paddle);
			state.add(textBox);
		}
		
		private var wins : uint;
		
		public function IncrementWins() : void
		{
			wins++;
			textBox.text = wins.toString();
			
			if (wins > 3)
			{
				GObj.Instance.EndGame(this);
			}
		}
		
	}

}