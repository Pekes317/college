package classes {
	
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import classes.CustomClick;
	
	public class NavBtn {
		public var btn: SimpleButton;
		public var vidData: Object;

		public function NavBtn(el, obj) {
			// constructor code
			this.btn = el;
			this.vidData = obj;
			this.btn.addEventListener(MouseEvent.CLICK, this.playVideo);
		}
		
		public function playVideo(e: Event) {
			var playEvent = new CustomClick(CustomClick.PLAY_CLICK, this.vidData);
			this.btn.dispatchEvent(playEvent);
		}
	}
	
}
