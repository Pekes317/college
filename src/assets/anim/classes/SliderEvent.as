package classes {
	import flash.events.Event

	public class SliderEvent extends Event {
		public static const SLIDER_MOVE: String = 'sliderMove';
		public var result: Object;

		public function SliderEvent(type: String, result: Object, bubbles: Boolean = false, cancelable: Boolean = false) {
			// constructor code
			super(type, bubbles, cancelable);
			this.result = result;
		}

		public override function clone(): Event {
			return new SliderEvent(type, result, bubbles, cancelable);
		}
	}
}