package com.shuperoids.floaters
{
	import com.shuperoids.Floater;
	import com.shuperoids.weapons.SmartGun;
	
	public class Gold extends Floater
	{
		
		public function Gold()
		{
			
		}
		
		override public function get award():*
		{
			return 150;
		}
	}
}