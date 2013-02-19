package com.shuperoids
{
	import flash.display.Sprite;
	
	public class GameObject extends Sprite
	{
		protected var vx:Number = 0;
		protected var vy:Number = 0;
		
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
			var asq:Number = this.vx * this.vx;
			var bsq:Number = this.vy * this.vy;
			var csq:Number = asq + bsq;
			return Math.sqrt(csq);
		}
		
		public function set speed(n:Number):void
		{
			this.vx = Math.cos(this.rotation * Math.PI / 180) * n;
			this.vy = Math.sin(this.rotation * Math.PI / 180) * n;
		}
		
		public function get direction():Number //in radians
		{
			return Math.atan2(this.vy, this.vx);
		}
		
		/*public function set direction(n:Number):void
		{
			this.rotation = n;
		}*/
	}
}










