package com.shuperoids
{
	public class LargeRock extends Rock
	{
		
		public function LargeRock()
		{
			this.minSpeed = 1;
			this.maxSpeed = 2;
			this.init();
		}
		
		override public function hit():void
		{
			for (var i:int = 0; i < 2;++i)
			{
				var medRock:MediumRock = new MediumRock();
				medRock.x = this.x;
				medRock.y = this.y;
			}
			super.hit();
		}
	}
}