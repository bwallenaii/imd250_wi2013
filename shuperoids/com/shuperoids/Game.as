package com.shuperoids
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
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
		
		
		public function Game():void
		{
			this.addEventListener(KeyboardEvent.KEY_DOWN, this.keyDown);
			this.addEventListener(KeyboardEvent.KEY_UP, this.keyUp);
			this.addEventListener(Event.ENTER_FRAME, this.run);
			this.focusRect = false;
			this.stage.focus = this;
		}
		
		/**
		 * Runs the game animation
		 * @param	e 	*	Ready to catch event object
		 */
		private function run(e:* = null):void
		{
			this.stage.focus = this;
			Ship.instance.run();
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
				default:
					
				break;
			}
		}
	}
}







