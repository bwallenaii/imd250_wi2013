package com
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Ball extends MovieClip
	{
		//variables go here!!
		protected static var numBalls:Number = 0;
		public var speed:Number = 3;
		
		public function Ball():void
		{
			numBalls++;
			trace(numBalls, Event.ENTER_FRAME);
		}
		
		//functions go here
		public function run():void
		{
			this.x += this.speed;
			this.y += this.speed;
		}
	}
	
}