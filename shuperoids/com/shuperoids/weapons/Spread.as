package com.shuperoids.weapons
{
	import com.shuperoids.Weapon;
	import com.shuperoids.Bullet;
	import com.shuperoids.Ship;
	
	public class Spread extends Weapon
	{
		public function Spread()
		{
			this.arcWidth = 90;
			this.rof = 8;
		}
		
		
		override protected function createShot(angle:Number):void
		{
			new Bullet(angle, Ship.instance.x, Ship.instance.y);
			new Bullet(angle - 15, Ship.instance.x, Ship.instance.y);
			new Bullet(angle + 15, Ship.instance.x, Ship.instance.y);
		}
	}
}