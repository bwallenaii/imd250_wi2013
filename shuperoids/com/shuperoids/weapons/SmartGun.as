package com.shuperoids.weapons
{
	import com.shuperoids.Weapon;
	import com.shuperoids.bullets.SmartBullet;
	import com.shuperoids.Ship;
	
	public class SmartGun extends Weapon
	{
		public function SmartGun()
		{
			this.rof = 3;
			this.arcWidth = 270;
		}
		
		override protected function createShot(angle:Number):void
		{
			new SmartBullet(angle, Ship.instance.x, Ship.instance.y);
		}
	}
}