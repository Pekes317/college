package classes {
	
	import flash.events.Event
	
	public class CustomClick extends Event {
		public static const PLAY_CLICK: String = 'PlayClick';
		public var result: Object;

		public function CustomClick(type: String, result: Object, bubbles: Boolean = false, cancelable: Boolean = false) {
			// constructor code
			super(type, bubbles, cancelable);
			this.result = result;
		}
		
		public override function clone(): Event {
			return new CustomClick(type, result, bubbles, cancelable);
		}
	}
	
}
