package com.shuperoids
{
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class Weapon
	{
		protected var rof:Number = 4; //number shots per second
		protected var timer:Timer;
		protected var canShoot:Boolean = true;

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
				this.createShot();
				this.canShoot = false;
				this.timer = new Timer(1000 / this.rof, 1);
				this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, this.enableFire);
				this.timer.start();
			}
		}
		
		protected function createShot():void
		{
			new Bullet(Ship.instance.rotation, Ship.instance.x, Ship.instance.y);
		}

	}

}