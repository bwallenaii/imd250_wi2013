package com.shuperoids.floaters
{
	import com.shuperoids.Floater;
	import com.shuperoids.weapons.MachineGun;
	
	public class UpMG extends Floater
	{
		
		public function UpMG()
		{
			
		}
		
		override public function get award():*
		{
			return new MachineGun();
		}
	}
}