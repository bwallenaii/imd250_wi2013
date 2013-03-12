package com.shuperoids
{
	public class Bullet extends GameObject
	{
		protected static var _bullets:Vector.<Bullet> = new Vector.<Bullet>();
		protected var moveSpeed:Number = 15;
		protected var ttl:Number = 24; //number of frames the bullet will live
		protected var dieOnHit:Boolean = true;

		public function Bullet(rot:Number = 0, startX:Number = 0, startY:Number = 0)
		{
			this.init(rot, startX, startY);
			bullets.push(this);
			Game.instance.addChild(this);
		}
		
		protected function init(rot:Number = 0, startX:Number = 0, startY:Number = 0):void
		{
			this.x = startX;
			this.y = startY;
			this.rotation = rot;
		}
		
		override public function run():void
		{
			super.run();
			this.ttl--;
			if (this.ttl <= 0)
			{
				this.destroy();
			}
			for (var i:int = 0; i < Rock.rocks.length;++i)
			{
				if (this.hitTestObject(Rock.rocks[i]))
				{
					Rock.rocks[i].hit();
					this.dieOnHit ? this.destroy():null;
					break;
				}
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
			if (this.destroyed)
			{
				return;
			}
			this.destroyed = true;
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
		
		public function set TTL(n:int):void
		{
			this.ttl = n;
		}
		
		public function set mvSpeed(n:int):void
		{
			this.moveSpeed = n;
			this.speed = this.moveSpeed;
		}

	}

}








