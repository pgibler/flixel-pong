package  
{
	import org.flixel.*;
	import gamespr.*;
	
	public class GObj
	{
		private var players : Vector.<Player>;
		
		public function GetPlayers():Vector.<Player> { return players; }
		public function SetPlayers(players:Vector.<Player>):void { this.players = players; }
		
		private var balls : Vector.<Ball>;
		
		public function GetBalls():Vector.<Ball> { return balls; }
		public function SetBalls(balls:Vector.<Ball>):void { this.balls = balls; }
		
		public function EndGame(victor:Player) : void
		{
			state.Stop();
			
			var width : Number = 30;
			var height : Number = 30;
			var txt : FlxText = new FlxText(FlxG.width / 2 - 15, FlxG.width / 2 - 15, FlxG.width, "Player " + victor.PlayerNumber + " wins! GG NOOBS");
			txt.health = height;
			
			state.add(txt);
		}
		
		private static var instance : GObj;
		private var state : PlayState;
		
		public function SetPlayState(state:PlayState):void { instance.state = state; }
		
		public static function get Instance():GObj { 
			if (instance == null)
			{
				instance = new GObj();
			}
			return instance;
		}
		
		public function GObj():void
		{
			players = new Vector.<Player>();
			balls = new Vector.<Ball>();
		}
		
	}

}