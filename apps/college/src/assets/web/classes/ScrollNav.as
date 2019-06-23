package classes {
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;

	public class ScrollNav {
		public var currentPos: int;
		public var navScroll: MovieClip;
		public var scrollDown: Boolean;

		public function ScrollNav(nav) {
			// constructor code
			this.navScroll = nav;
			this.navScroll.addEventListener(MouseEvent.MOUSE_OVER, this.startScroll);
			this.navScroll.addEventListener(MouseEvent.MOUSE_OUT, this.stopScroll);
		}
		
		private function playScroll(e: Event) {
			var frame;
			if(this.scrollDown) frame = this.navScroll.currentFrame + 1;
			else frame = this.navScroll.currentFrame - 1;
			this.navScroll.gotoAndStop(frame);
		}

		private function startScroll(e: MouseEvent) {
			var pos = this.navScroll.mouseY / this.navScroll.getChildAt(0).height;
			this.currentPos = this.navScroll.mouseY;
			if (pos < .5) {
				this.scrollDown = false;
			} else {
				this.scrollDown = true;
			}
			if(e.ctrlKey) {
				this.navScroll.addEventListener(Event.ENTER_FRAME, this.playScroll);
			}
			//this.navScroll.addEventListener(Event.ENTER_FRAME, this.playScroll);
		}
		
		private function stopScroll(e: MouseEvent) {
			this.navScroll.removeEventListener(Event.ENTER_FRAME, this.playScroll);
		}
	}

}