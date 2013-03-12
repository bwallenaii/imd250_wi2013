package com.shuperoids
{
	import flash.display.Sprite;
	import com.greensock.TweenMax;
	
	public class CrossHair extends Sprite
	{
		private static const INACTIVE_COLOR:uint = 0x222222;
		private static var CR:CrossHair;
		
		public function CrossHair():void
		{
			CR = this;
			this.mouseEnabled = false;
		}
		
		public function set ready(b:Boolean):void
		{
			if (b)
			{
				TweenMax.to(this, 0.25,  {colorTransform: { tint:INACTIVE_COLOR, tintAmount:0 }} );
			}
			else
			{
				TweenMax.to(this, 0.25,  {colorTransform: { tint:INACTIVE_COLOR, tintAmount:0.9 }} );
			}
		}
		
		public static function get instance():CrossHair
		{
			return CR;
		}
	}
}