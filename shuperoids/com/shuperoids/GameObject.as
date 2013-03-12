package com.shuperoids
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class GameObject extends Sprite
	{
		protected var vx:Number = 0;
		protected var vy:Number = 0;
		protected var destroyed:Boolean = false;
		
		public function GameObject():void
		{
			this.mouseEnabled = false;
			this.mouseChildren = false;
			if (this.getChildByName("hitSpot"))
			{
				this.hitArea = this.getChildByName("hitSpot") as HitSpot;
			}
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
		
		public function distanceBetween(ob1:DisplayObject, ob2:DisplayObject):Number
		{
			var a:Number = ob1.x - ob2.x;
			var b:Number = ob1.y - ob2.y;
			var asq:Number = a * a;
			var bsq:Number = b * b;
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
		
		public function get isDestroyed():Boolean
		{
			return this.destroyed;
		}
	}
}










