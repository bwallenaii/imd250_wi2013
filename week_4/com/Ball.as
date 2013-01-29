package com
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Ball extends MovieClip
	{
		//variables go here!!
		public static const TOP_WALL:Number = 0;
		public static const LEFT_WALL:Number = 0;
		public static const RIGHT_WALL:Number = 550;
		public static const BOTTOM_WALL:Number = 400;
		protected static var numBalls:Number = 0;
		private var vx = 3;
		private var vy = 3;
		
		public function Ball():void
		{
			numBalls++;
		}
		
		//functions go here
		public function run():void
		{
			this.x += this.vx;
			this.y += this.vy;
			if(this.right > RIGHT_WALL)
			{
				this.vx = -this.speed;
				this.right = RIGHT_WALL;
			}
			if(this.left < LEFT_WALL)
			{
				this.vx = this.speed;
				this.left = LEFT_WALL;
			}
			if(this.top < TOP_WALL)
			{
				this.vy = this.speed;
				this.top = TOP_WALL;
			}
			if(this.bottom > BOTTOM_WALL)
			{
				this.vy = -this.speed;
				this.bottom = BOTTOM_WALL;
			}
		}
		
		public function set speed(n:Number):void
		{
			this.vx = this.vx < 0 ? -n:n;
			this.vy = this.vy < 0 ? -n:n;
		}
		
		public function get speed():Number
		{
			return Math.abs(this.vx);
		}
		
		public function get top():Number
		{
			return this.y - (this.height/2);
		}
		
		public function set top(n:Number):void
		{
			this.y = n + (this.height/2);
		}
		
		public function get bottom():Number
		{
			return this.y + (this.height/2);
		}
		
		public function set bottom(n:Number):void
		{
			this.y = n - (this.height/2);
		}
		
		public function get left():Number
		{
			return this.x - (this.width/2);
		}
		
		public function set left(n:Number):void
		{
			this.x = n + (this.width/2);
		}
		
		public function get right():Number
		{
			return this.x + (this.width/2);
		}
		
		public function set right(n:Number):void
		{
			this.x = n - (this.width/2);
		}
	}
	
}








