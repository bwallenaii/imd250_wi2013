package com.shuperoids.floaters
{
	import com.shuperoids.Floater;
	import com.shuperoids.weapons.SmartGun;
	
	public class UpSmart extends Floater
	{
		
		public function UpSmart()
		{
			
		}
		
		override public function get award():*
		{
			return new SmartGun();
		}
	}
}