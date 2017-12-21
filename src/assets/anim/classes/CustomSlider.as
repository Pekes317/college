package classes {

	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import classes.SliderEvent;

	public class CustomSlider {
		public var boundWidth: Number;
		public var boundRect: Rectangle;
		public var mc: MovieClip;
		public var slide: MovieClip;
		public var knob: MovieClip;
		public var knobPos: Number;

		public function CustomSlider(main, bar, back) {
			// constructor code
			this.mc = main;
			this.knob = bar;
			this.slide = back;
			this.boundWidth = back.width - bar.width;
			this.boundRect = new Rectangle(this.slide.x, 0, this.boundWidth, 0);
			this.mc.addEventListener(MouseEvent.MOUSE_DOWN, this.startSlide);
			this.mc.addEventListener(MouseEvent.MOUSE_OVER, this.cursorGrab);
			this.mc.addEventListener(MouseEvent.MOUSE_UP, this.stopSlide);
			this.mc.addEventListener(MouseEvent.MOUSE_OUT, this.stopSlide);
		}
		
		public function setKnob(pos: Number) {
			var newPos = this.boundWidth * pos;
			this.knob.x = newPos;
		}
		
		public function sliderPos() {
			this.knobPos = (this.knob.x / this.boundWidth);
			this.knob.dispatchEvent(new SliderEvent(SliderEvent.SLIDER_MOVE, this.knobPos));
		}
		
		private function cursorGrab(e: MouseEvent) {
			Mouse.cursor = 'hand';
		}
		
		private function startSlide(e: MouseEvent) {
			this.knob.startDrag(false, this.boundRect);
		}
		
		private function stopSlide(e: MouseEvent) {
			this.knob.stopDrag();
			if (e.type === 'mouseOut') this.resetGrab(e);
			if (e.type === 'mouseUp') this.sliderPos();
		}
		
		private function resetGrab(e: MouseEvent) {
			Mouse.cursor = 'auto';
		}
	}
}