package com.shuperoids
{
	
	public class PowerUp extends GameObject
	{
		
		public function PowerUp()
		{
			
		}
		
		public function get type():String
		{
			//this should be overridded in all classes
			return "none";
		}
	}
}