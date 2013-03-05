package com.shuperoids
{
	public class MediumRock extends Rock
	{
		
		public function MediumRock()
		{
			this.minSpeed = 2;
			this.maxSpeed = 4;
			this.pointValue = 15;
			this.init();
		}
		
		override public function hit():void
		{
			for (var i:int = 0; i < 3;++i)
			{
				var smallRock:SmallRock = new SmallRock();
				smallRock.x = this.x;
				smallRock.y = this.y;
			}
			super.hit();
		}
	}
}