package com.shuperoids
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * @name Game
	 * Main engine for the game. Tells objects to move appropriately and 
	 * manages game modules. Also the central ENTER_FRAME listener.
	 */
	
	public class Game extends Sprite
	{
		
		
		public function Game():void
		{
			this.addEventListener(KeyboardEvent.KEY_DOWN, this.keyDown);
			this.addEventListener(KeyboardEvent.KEY_UP, this.keyUp);
			this.addEventListener(Event.ENTER_FRAME, this.run);
			this.stage.focus = this;
		}
		
		/**
		 * Runs the game animation
		 * @param	e 	*	Ready to catch event object
		 */
		private function run(e:* = null):void
		{
			this.stage.focus = this;
		}
		
		public function keyDown(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				
				default:
					
				break;
			}
		}
		
		public function keyUp(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				
				default:
					
				break;
			}
		}
	}
}







