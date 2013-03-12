package com.shuperoids.floaters
{
	import com.shuperoids.Floater;
	import com.shuperoids.weapons.Turret;
	
	public class UpShield extends Floater
	{
		
		public function UpShield()
		{
			
		}
		
		override public function get award():*
		{
			return "shield";
		}
	}
}