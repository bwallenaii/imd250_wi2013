package com.shuperoids.floaters
{
	import com.shuperoids.Floater;
	import com.shuperoids.weapons.Turret;
	
	public class UpTurret extends Floater
	{
		
		public function UpTurret()
		{
			
		}
		
		override public function get award():*
		{
			return new Turret();
		}
	}
}