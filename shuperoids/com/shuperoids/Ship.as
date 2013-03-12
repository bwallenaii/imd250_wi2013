package com.shuperoids
{
	import com.shuperoids.weapons.*;
	
	
	public class Ship extends GameObject
	{
		private static var ship:Ship;
		private var rotateSpeed:Number = 8;
		private var _spinLeft:Boolean = false;
		private var _spinRight:Boolean = false;
		private var _thrust:Boolean = false;
		private var _fire:Boolean = false;
		private var _slow:Boolean = false;
		private var weapon:Weapon;
		private var acceleration:Number = 0.5;
		private var topSpeed:Number = 6;
		private var startX:Number = 0;
		private var startY:Number = 0;
		
		public function Ship():void
		{
			ship = this;
			this.startX = this.x;
			this.startY = this.y;
			this.weapon = new MachineGun();
		}
		
		override public function run():void
		{
			this.spinLeft ? this.rotateLeft():null;
			this.spinRight ? this.rotateRight():null;
			this.thrust ? this.moveShip():null;
			this.slow ? this.slowShip():null;
			super.run();
			this.fire ? this.weapon.fire():null;
			if (this.invincible)
			{
				this.shield.alpha *= 0.95;
			}
		}
		
		public function moveShip():void
		{
			if (this.speed > this.topSpeed)
			{
				this.vx -= Math.cos(this.direction) * this.acceleration;
				this.vy -= Math.sin(this.direction) * this.acceleration;
			}
			this.vx += Math.cos(this.rotation * (Math.PI / 180)) * this.acceleration;
			this.vy += Math.sin(this.rotation * (Math.PI / 180)) * this.acceleration;
		}
		
		public function slowShip():void
		{
			this.vx -= Math.cos(this.direction) * this.acceleration / 2;
			this.vy -= Math.sin(this.direction) * this.acceleration / 2;
		}
		
		public function rotateLeft():void
		{
			this.rotation -= this.rotateSpeed;
		}
		
		public function rotateRight():void
		{
			this.rotation += this.rotateSpeed;
		}
		
		public function die():void
		{
			if (this.invincible)
			{
				return;
			}
			//return to start
			this.x = this.startX;
			this.y = this.startY;
			this.rotation = 0;
			this.speed = 0;
			this.shield.alpha = 1;
			//decrement lives
			Game.instance.lives--;
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
		
		public function set thrust(b:Boolean):void
		{
			this._thrust = b;
		}
		
		public function get thrust():Boolean
		{
			return this._thrust;
		}
		
		public function set fire(b:Boolean):void
		{
			this._fire = b;
		}
		
		public function get fire():Boolean
		{
			return this._fire;
		}
		
		public function set slow(b:Boolean):void
		{
			this._slow = b;
		}
		
		public function get slow():Boolean
		{
			return this._slow;
		}
		
		public function get invincible():Boolean
		{
			return this.shield.alpha > 0.05;
		}
	}
}
















