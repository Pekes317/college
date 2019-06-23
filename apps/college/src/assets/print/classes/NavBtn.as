package classes {
	
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import classes.CustomClick;
	
	public class NavBtn {
		public var btn: SimpleButton;
		public var imgData: Object;

		public function NavBtn(el, obj) {
			// constructor code
			this.btn = el;
			this.imgData = obj;
			this.btn.addEventListener(MouseEvent.CLICK, this.urlLoad);
		}
		
		public function urlLoad(e: Event) {
			var loadEvent = new CustomClick(CustomClick.PLAY_CLICK, this.imgData);
			this.btn.dispatchEvent(loadEvent);
		}
	}
	
}
