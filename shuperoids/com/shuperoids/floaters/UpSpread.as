package com.shuperoids.floaters
{
	import com.shuperoids.Floater;
	import com.shuperoids.weapons.Spread;
	
	public class UpSpread extends Floater
	{
		
		public function UpSpread()
		{
			
		}
		
		override public function get award():*
		{
			return new Spread();
		}
	}
}