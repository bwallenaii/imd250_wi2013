package com.shuperoids.bullets
{
	import com.shuperoids.Bullet;
	import com.shuperoids.Rock;
	import flash.display.DisplayObject;
	
	public class SmartBullet extends Bullet
	{
		private static const ROTATE_SPEED:Number = 15;
		private var target:Rock = null;
		
		public function SmartBullet(rot:Number = 0, startX:Number = 0, startY:Number = 0)
		{
			this.init(rot, startX, startY);
			this.ttl = 48;
			this.findClosestTarget();
		}
		
		override public function run():void
		{
			if (this.target == null || this.target.isDestroyed)
			{
				this.findClosestTarget();
			}
			if (this.target != null)
			{
				var curRot = this.rotation < 0 ? 360 + this.rotation % 360 : this.rotation % 360;
				var targRot = Math.atan2(this.target.y - this.y, this.target.x - this.x) * 180 / Math.PI;
				targRot = targRot < 0 ? 360 + targRot % 360 : targRot % 360;
				
				if (curRot < targRot)
				{
					this.rotation = curRot + ROTATE_SPEED;
				}
				else if (curRot > targRot)
				{
					this.rotation = curRot - ROTATE_SPEED;
				}
			}
			super.run();
		}
		
		public function findRandomTarget():void
		{
			if (Rock.rocks.length > 0)
			{
				this.target = Rock.rocks[Math.floor(Math.random() * Rock.rocks.length)];
			}
		}
		
		public function findClosestTarget():void
		{
			if (Rock.rocks.length > 0)
			{
				var distance:Number = 50000;
				var curTarg:Rock = null;
				for (var i:int = 0; i < Rock.rocks.length;++i)
				{
					var dist:Number = this.distanceBetween(this, Rock.rocks[i]);
					if (dist < distance)
					{
						curTarg = Rock.rocks[i];
						distance = dist;
					}
				}
				this.target = curTarg;
			}
		}
	}
}