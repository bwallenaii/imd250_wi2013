package com.shuperoids
{
	
	public class Rock extends GameObject
	{
		private static var _rocks:Vector.<Rock> = new Vector.<Rock>();
		
		protected var minSpeed:Number = 0;
		protected var maxSpeed:Number = 0;
		
		public function Rock():void
		{
			//add it to the vector
			rocks.push(this);
			//add it to the game
			Game.instance.addChild(this);
		}
		
		protected function init():void
		{
			this.rotation = Math.random() * 360;
			this.speed = (Math.random() * (this.maxSpeed - this.minSpeed)) + this.minSpeed;
		}
		
		public function hit():void
		{
			this.destroy();
		}
		
		public function destroy():void
		{
			if (this.destroyed)
			{
				return;
			}
			this.destroyed = true;
			for (var i = 0; i < rocks.length;++i)
			{
				if (rocks[i] == this)
				{
					rocks.splice(i, 1);
					break;
				}
			}
			Game.instance.removeChild(this);
		}
		
		public static function get rocks():Vector.<Rock>
		{
			return _rocks;
		}
	}
}