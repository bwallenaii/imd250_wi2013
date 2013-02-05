package com
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.FrameListener;
	import flash.events.ProgressEvent;
	
	public class Main extends MovieClip
	{
		protected var listener:FrameListener;
		
		
		
		public function Main():void
		{
			this.listener = new FrameListener(this);
			this.listener.addListener("landing", this.buildLanding);
			this.listener.addListener("instructions", this.buildInstructions);
			this.listener.addListener("game", this.buildGame);
			this.listener.addListener("end", this.buildEnd);
			
			this.loaderInfo.addEventListener(ProgressEvent.PROGRESS, this.loadProgress);
			this.loaderInfo.addEventListener(Event.COMPLETE, this.loadComplete);
			
			stop();
		}
		
		protected function loadProgress(e:ProgressEvent):void
		{
			var perc:Number = e.bytesLoaded / e.bytesTotal;
			trace(perc);
		}
		
		protected function loadComplete(e:* = null):void
		{
			this.gotoLanding();
		}
		
		
		// ------------ Navigation Functions
		public function gotoLanding(e:* = null):void
		{
			gotoAndStop("landing");
		}

		public function gotoInstructions(e:* = null):void
		{
			gotoAndStop("instructions");
		}

		public function gotoGame(e:* = null):void
		{
			gotoAndStop("game");
		}

		public function gotoEnd(e:* = null):void
		{
			gotoAndStop("end");
		}
		
		//---------- Builder functions
		
		protected function buildLanding():void
		{
			_playBtn.addEventListener(MouseEvent.CLICK, gotoGame);
			_instBtn.addEventListener(MouseEvent.CLICK, gotoInstructions);
		}
		
		protected function buildInstructions():void
		{
			_playBtn.addEventListener(MouseEvent.CLICK, gotoGame);
		}
		
		protected function buildGame():void
		{
			_endBtn.addEventListener(MouseEvent.CLICK, gotoEnd);
		}
		
		protected function buildEnd():void
		{
			_playBtn.addEventListener(MouseEvent.CLICK, gotoGame);
		}
	}
}









