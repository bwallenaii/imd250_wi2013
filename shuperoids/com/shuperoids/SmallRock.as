package com.shuperoids
{
	public class SmallRock extends Rock
	{
		
		public function SmallRock()
		{
			this.minSpeed = 3;
			this.maxSpeed = 5;
			this.pointValue = 27;
			this.dropChance = 0.18;
			this.init();
		}
	}
}