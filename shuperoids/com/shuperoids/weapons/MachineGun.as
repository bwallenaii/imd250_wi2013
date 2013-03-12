package com.shuperoids.weapons
{
	import com.shuperoids.Weapon;
	import com.shuperoids.Bullet;
	import com.shuperoids.Ship;
	
	public class MachineGun extends Weapon
	{
		public function MachineGun()
		{
			this.rof = 23;
		}
		
		override protected function createShot(angle:Number):void
		{
			var bl:Bullet =  new Bullet(angle, Ship.instance.x, Ship.instance.y);
			bl.TTL = 18;
			bl.mvSpeed = 18;
		}
	}
}