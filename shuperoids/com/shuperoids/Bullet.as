﻿package com.shuperoids
{
	public class Bullet extends GameObject
	{
		protected static var _bullets:Vector.<Bullet> = new Vector.<Bullet>();
		protected var moveSpeed:Number = 15;
		protected var ttl:Number = 24; //number of frames the bullet will live

		public function Bullet(rot:Number = 0, startX:Number = 0, startY:Number = 0)
		{
			this.x = startX;
			this.y = startY;
			this.rotation = rot;
			bullets.push(this);
			Game.instance.addChild(this);
		}
		
		override public function run():void
		{
			super.run();
			this.ttl--;
			if (this.ttl <= 0)
			{
				this.destroy();
			}
		}
		
		override public function set rotation(n:Number):void
		{
			super.rotation = n;
			this.speed = this.moveSpeed;
		}
		
		public static function get bullets():Vector.<Bullet>
		{
			return _bullets;
		}
		
		public function destroy(e:* = null):void
		{
			for (var i = 0; i < bullets.length;++i)
			{
				if (bullets[i] == this)
				{
					bullets.splice(i, 1);
					break;
				}
			}
			Game.instance.removeChild(this);
		}

	}

}