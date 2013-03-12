package com.shuperoids
{
	import com.Main;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	/**
	 * @name Game
	 * Main engine for the game. Tells objects to move appropriately and 
	 * manages game modules. Also the central ENTER_FRAME listener.
	 */
	
	public class Game extends Sprite
	{
		public static const TOP_WALL:Number = 0;
		public static const BOTTOM_WALL:Number = 400;
		public static const LEFT_WALL:Number = 0;
		public static const RIGHT_WALL:Number = 550;
		public static const EXTRA_ROCKS:int = 2;
		public static const COLORS:Array = new Array(0x009900,
													0xFFEE07,
													0x0A3AC6,
													0xB11111,
													0x7D11B1,
													0xAAAAAA);
		private static var game:Game;
		
		
		public function Game():void
		{
			this.mouseChildren = false;
			this.addEventListener(KeyboardEvent.KEY_DOWN, this.keyDown);
			this.addEventListener(KeyboardEvent.KEY_UP, this.keyUp);
			this.addEventListener(Event.ENTER_FRAME, this.run);
			this.addEventListener(MouseEvent.MOUSE_DOWN, this.msDown);
			this.addEventListener(MouseEvent.MOUSE_UP, this.msUp);
			this.focusRect = false;
			this.stage.focus = this;
			game = this;
			this.startLevel();
		}
		
		/**
		 * Runs the game animation
		 * @param	e 	*	Ready to catch event object
		 */
		private function run(e:* = null):void
		{
			this.stage.focus = this;
			
			for (var i = 0; i < Bullet.bullets.length; i++)
			{
				Bullet.bullets[i].run();
			}
			for (i = 0; i < Rock.rocks.length;++i)
			{
				Rock.rocks[i].run();
			}
			Ship.instance.run();
			if (Rock.rocks.length == 0)
			{
				this.level++;
				startLevel();
			}
			
			if (this.lives < 0)
			{
				this.endGame();
			}
		}
		
		private function startLevel():void
		{
			for (var i:int = 0; i < this.level + EXTRA_ROCKS;++i)
			{
				new LargeRock();
			}
		}
		
		private function endGame(e:* = null):void
		{
			this.removeEventListener(KeyboardEvent.KEY_DOWN, this.keyDown);
			this.removeEventListener(KeyboardEvent.KEY_UP, this.keyUp);
			this.removeEventListener(Event.ENTER_FRAME, this.run);
			this.removeEventListener(MouseEvent.MOUSE_DOWN, this.msDown);
			this.removeEventListener(MouseEvent.MOUSE_UP, this.msUp);
			while (Rock.rocks.length > 0)
			{
				Rock.rocks[0].destroy();
			}
			while (Bullet.bullets.length > 0)
			{
				Bullet.bullets[0].destroy();
			}
			
			if (this.parent)
			{
				(this.parent as Main).gotoEnd();
			}
		}
		
		public function keyDown(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				case Keyboard.A:
				case Keyboard.LEFT:
					Ship.instance.spinLeft = true;
				break;
				case Keyboard.D:
				case Keyboard.RIGHT:
					Ship.instance.spinRight = true;
				break;
				case Keyboard.W:
				case Keyboard.UP:
					Ship.instance.thrust = true;
				break;
				case Keyboard.S:
				case Keyboard.DOWN:
					Ship.instance.slow = true;
				break;
				default:
					
				break;
			}
		}
		
		public function keyUp(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				case Keyboard.A:
				case Keyboard.LEFT:
					Ship.instance.spinLeft = false;
				break;
				case Keyboard.D:
				case Keyboard.RIGHT:
					Ship.instance.spinRight = false;
				break;
				case Keyboard.W:
				case Keyboard.UP:
					Ship.instance.thrust = false;
				break;
				case Keyboard.S:
				case Keyboard.DOWN:
					Ship.instance.slow = false;
				break;
				default:
					
				break;
			}
		}
		
		public function msDown(e:* = null):void
		{
			Ship.instance.fire = true;
		}
		
		public function msUp(e:* = null):void
		{
			Ship.instance.fire = false;
		}
		
		public function get lives():int
		{
			return int(this._lives.text);
		}
		
		public function set lives(n:int):void
		{
			this._lives.text = n.toString();
		}
		
		public function get score():int
		{
			return int(this._score.text);
		}
		
		public function set score(n:int):void
		{
			this._score.text = n.toString();
		}
		
		public function get level():int
		{
			return int(this._level.text);
		}
		
		public function set level(n:int):void
		{
			this._level.text = n.toString();
		}
		
		public static function get instance():Game
		{
			return game;
		}
	}
}







