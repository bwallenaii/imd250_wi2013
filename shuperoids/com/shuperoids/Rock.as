package com.shuperoids
{
	import com.greensock.TweenMax;
	
	public class Rock extends GameObject
	{
		private static var _rocks:Vector.<Rock> = new Vector.<Rock>();
		
		protected var minSpeed:Number = 0;
		protected var maxSpeed:Number = 0;
		protected var pointValue:int = 10;
		private var rot:Number = 0;
		
		public function Rock():void
		{
			//add it to the vector
			rocks.push(this);
			//add it to the game
			Game.instance.addChild(this);
			var color:uint = Game.COLORS[ (Game.instance.level - 1) % Game.COLORS.length ];
			TweenMax.to(this, 0,  {colorTransform: { tint:color, tintAmount:0.5 }} );
		}
		
		protected function init():void
		{
			this.rotation = Math.random() * 360;
			this.speed = (Math.random() * (this.maxSpeed - this.minSpeed)) + this.minSpeed;
		}
		
		override public function run():void
		{
			super.run();
			
			if (this.hitArea.hitTestObject(Ship.instance.hitArea))
			{
				Ship.instance.die();
				this.hit();
			}
		}
		
		public function hit():void
		{
			Game.instance.score += this.pointValue;
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
		
		override public function set rotation(n:Number):void
		{
			this.rot = n;
		}
		
		override public function get rotation():Number
		{
			return this.rot;
		}
	}
}