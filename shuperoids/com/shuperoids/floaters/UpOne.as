package com.shuperoids.floaters
{
	import com.shuperoids.Floater;
	import com.shuperoids.weapons.Turret;
	
	public class UpOne extends Floater
	{
		
		public function UpOne()
		{
			
		}
		
		override public function get award():*
		{
			return "1up";
		}
	}
}