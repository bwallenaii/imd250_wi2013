package com.shuperoids
{
	
	public class Floater extends GameObject
	{
		private var rot:Number = 0;
		protected var ttl:Number = 240;
		protected static var _floaters:Vector.<Floater> = new Vector.<Floater>();
		public static const availableFloaters:Array = new Array("UpSpread", "Gold", "UpPlasma", 
			"Gold", "UpShield", "UpMG", "Gold", "UpShield", "UpSmart", 
			"Gold", "UpTurret", "UpShield", "UpOne");
		
		public function Floater():void
		{
			floaters.push(this);
			Game.instance.addChild(this);
		}
		
		override public function run():void
		{
			this.speed *= 0.85;
			super.run();
			this.ttl--;
			if (this.ttl <= 0)
			{
				this.destroy();
			}
			if (this.hitTestObject(Ship.instance.hitArea))
			{
				Ship.instance.receiveAward(this.award);
				this.destroy();
			}
		}
		
		public function destroy(e:* = null):void
		{
			if (this.destroyed)
			{
				return;
			}
			this.destroyed = true;
			for (var i = 0; i < floaters.length;++i)
			{
				if (floaters[i] == this)
				{
					floaters.splice(i, 1);
					break;
				}
			}
			Game.instance.removeChild(this);
		}
		
		public function get award():*
		{
			return null;
		}
		
		override public function set rotation(n:Number):void
		{
			this.rot = n;
		}
		
		override public function get rotation():Number
		{
			return this.rot;
		}
		
		public static function get floaters():Vector.<Floater>
		{
			return _floaters;
		}
	}
}