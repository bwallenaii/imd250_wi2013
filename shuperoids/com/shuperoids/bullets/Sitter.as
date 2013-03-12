package com.shuperoids.bullets
{
	import com.shuperoids.Bullet;
	
	public class Sitter extends Bullet
	{
		private var growthSpeed:Number = 0.2;
		
		public function Sitter(rot:Number = 0, startX:Number = 0, startY:Number = 0)
		{
			this.init(rot, startX, startY);
			this.ttl = 96;
			this.dieOnHit = false;
		}
		
		override public function run():void
		{
			this.speed *= 0.9;
			
			if (this.growthSpeed > 0)
			{
				this.scaleX *= 1 + (this.growthSpeed);
				this.scaleY = this.scaleX;
				this.growthSpeed -= 0.01;
			}
			super.run();
			this.alpha = this.ttl / 10;
		}
	}
}