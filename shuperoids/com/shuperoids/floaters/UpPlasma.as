package com.shuperoids.floaters
{
	import com.shuperoids.Floater;
	import com.shuperoids.weapons.Plasma;
	
	public class UpPlasma extends Floater
	{
		
		public function UpPlasma()
		{
			
		}
		
		override public function get award():*
		{
			return new Plasma();
		}
	}
}