package com.shuperoids
{
	
	
	public class Ship extends GameObject
	{
		private static var ship:Ship;
		private var rotateSpeed:Number = 8;
		private var _spinLeft:Boolean = false;
		private var _spinRight:Boolean = false;
		
		
		public function Ship():void
		{
			ship = this;
		}
		
		override public function run():void
		{
			this.spinLeft ? this.rotateLeft():null;
			this.spinRight ? this.rotateRight():null;
			
			super.run();
		}
		
		public function rotateLeft():void
		{
			this.rotation -= this.rotateSpeed;
		}
		
		public function rotateRight():void
		{
			this.rotation += this.rotateSpeed;
		}
		
		public static function get instance():Ship
		{
			return ship;
		}
		
		public function set spinLeft(b:Boolean):void
		{
			this._spinLeft = b;
		}
		
		public function get spinLeft():Boolean
		{
			return this._spinLeft;
		}
		
		public function set spinRight(b:Boolean):void
		{
			this._spinRight = b;
		}
		
		public function get spinRight():Boolean
		{
			return this._spinRight;
		}
	}
}
















