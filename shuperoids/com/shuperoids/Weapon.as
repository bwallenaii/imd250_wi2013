package com.shuperoids
{
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class Weapon
	{
		protected var rof:Number = 4; //number shots per second
		protected var timer:Timer;
		protected var canShoot:Boolean = true;
		protected var arcWidth:Number = 90;

		public function Weapon()
		{
			
		}
		
		public function enableFire(e:* = null):void
		{
			this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE, this.enableFire);
			this.timer.stop();
			this.timer = null;
			this.canShoot = true;
		}
		
		public function fire():void
		{
			if (this.canShoot)
			{
				this.createShot(this.inSight ? this.figureAngle():Ship.instance.rotation);
				this.canShoot = false;
				this.timer = new Timer(1000 / this.rof, 1);
				this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, this.enableFire);
				this.timer.start();
			}
		}
		
		protected function createShot(angle:Number):void
		{
			new Bullet(angle, Ship.instance.x, Ship.instance.y);
		}
		
		private function figureAngle():Number
		{
			var sh:Ship = Ship.instance;
			var gm:Game = Game.instance;
			var mouseAngle:Number = Math.atan2(gm.mouseY - sh.y, gm.mouseX - sh.x);
			return mouseAngle * 180 / Math.PI;
		}
		
		public function get inSight():Boolean
		{
			var sh:Ship = Ship.instance;
			var mouseAngle = this.figureAngle();
			return (sh.rotation > mouseAngle - (this.arcWidth / 2)
						&& sh.rotation < mouseAngle + (this.arcWidth / 2));
		}

	}

}



