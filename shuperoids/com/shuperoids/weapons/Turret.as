package com.shuperoids.weapons
{
	import com.shuperoids.Weapon;
	import com.shuperoids.Bullet;
	import com.shuperoids.Ship;
	
	public class Turret extends Weapon
	{
		public function Turret()
		{
			this.arcWidth = 360;
			this.rof = 10;
		}
		
		
		override protected function createShot(angle:Number):void
		{
			new Bullet(angle, Ship.instance.x, Ship.instance.y);
		}
	}
}