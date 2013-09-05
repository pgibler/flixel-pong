package 
{
	import gamespr.*;
	import org.flixel.*;
	
	public class PlayState extends FlxState 
	{
		
		public function PlayState():void 
		{
			GObj.Instance.SetPlayState(this);
			
			var offset : Number = 0;
			var goalWidth : Number = 10;
			var goalHeight : Number = FlxG.height;
			var goalOffset : Number = 20;
			var paddleHeight : Number = 50;
			var paddleWidth : Number = 30;
			var textWidth : Number = 10;
			var textHeight : Number = 10;
			var textXOffset : Number = 40;
			var textYOffset : Number = 10;
			
			var player1 : Player = new HumanPlayer(
					this,
					new RectangleGoal( goalOffset-goalWidth, 0, goalWidth, goalHeight), 
					new RectanglePaddle(offset, FlxG.height / 2 - paddleHeight, paddleWidth, paddleHeight),
					new FlxText(textXOffset, textYOffset, textWidth, "0"));
					
			GObj.Instance.GetPlayers().push(player1);
			
			var player2 : Player = new ComputerPlayer(
					this,
					new RectangleGoal(FlxG.width-goalOffset , 0, goalWidth, goalHeight ), 
					new RectanglePaddle(FlxG.width - offset - paddleWidth, FlxG.height / 2 - paddleHeight, paddleWidth, paddleHeight),
					new FlxText(FlxG.width - textXOffset - textWidth, textYOffset, textWidth, "0"));
					
			GObj.Instance.GetPlayers().push(player2);
			
			add( player1 );
			add( player2 );
			
			var ball : Ball = new Ball();
			add( ball );
		}
		
		override public function update():void 
		{
			super.update();
			
			if(running)
			{
				UpdateMethod();
			}
		}
		
		private var running : Boolean = true;
		
		public function Stop():void { 
			running = false;
			
			for each (var ball : Ball in GObj.Instance.GetBalls()) 
			{
				ball.Stop();
			}
			for each(var player : Player in GObj.Instance.GetPlayers())
			{
				player.Stop();
			}
		}
		public function Start():void {
			running = true;
			
			for each (var ball : Ball in GObj.Instance.GetBalls()) 
			{
				ball.Start();
			}
			for each(var player : Player in GObj.Instance.GetPlayers())
			{
				player.Start();
			}
		}
		
		private function UpdateMethod():void
		{
			var balls : Vector.<Ball> = GObj.Instance.GetBalls();
			var players : Vector.<Player> = GObj.Instance.GetPlayers();
			
			for each (var ball : Ball in balls) 
			{
				for each(var player : Player in players)
				{
					// sets up the goal to get hit
					FlxU.overlap(player.Goal, ball, function():void
					{
						for each(var nonHitPlayer : Player in GetOtherPlayers( GObj.Instance.GetPlayers(), player ))
						{
							nonHitPlayer.IncrementWins();
						}
						
						if(running)
						{
							ball.Reset();
						}
						else
						{
							ball.kill();
						}
					});
					
					// Attempt to bounce the ball
					player.PlayerPaddle.TryBounce(ball);
				}
			}
		}
		
		private function GetOtherPlayers(players:Vector.<Player>, ignoreme:Player):Vector.<Player>
		{
			return players.filter( function(item:*, index:int, arr:Vector.<Player>):Boolean { return ignoreme != item; });
		}
		
	}
	
}