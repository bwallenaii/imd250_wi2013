package com.shuperoids.weapons
{
	import com.shuperoids.Weapon;
	import com.shuperoids.bullets.Sitter;
	import com.shuperoids.Ship;
	
	public class Plasma extends Weapon
	{
		public function Plasma()
		{
			this.arcWidth = 180;
			this.rof = 4;
		}
		
		
		override protected function createShot(angle:Number):void
		{
			new Sitter(angle, Ship.instance.x, Ship.instance.y);
		}
	}
}