package com.shuperoids
{
	import flash.display.Sprite;
	
	public class GameObject extends Sprite
	{
		protected var vx:Number = 0;
		protected var vy:Number = 0;
		protected var _speed:Number = 0;
		
		public function GameObject():void
		{
			
		}
		
		public function run():void
		{
			this.x += this.vx;
			this.y += this.vy;
			
			if (this.x > Game.RIGHT_WALL)
			{
				this.x = Game.LEFT_WALL;
			}
			if (this.x < Game.LEFT_WALL)
			{
				this.x = Game.RIGHT_WALL;
			}
			if (this.y > Game.BOTTOM_WALL)
			{
				this.y = Game.TOP_WALL;
			}
			if (this.y < Game.TOP_WALL)
			{
				this.y = Game.BOTTOM_WALL;
			}
		}
		
		public function get speed():Number
		{
			return this._speed;
		}
		
		public function set speed(n:Number):void
		{
			this._speed = n;
		}
		
		public function get direction():Number
		{
			return this.rotation;
		}
		
		public function set direction(n:Number):void
		{
			this.rotation = n;
		}
	}
}










