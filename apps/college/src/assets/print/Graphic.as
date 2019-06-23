package {

	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;

	public class Graphic extends MovieClip {

		public var gallery: Boolean = false;
		public var myLoader: Loader = new Loader();
		public var urlReq: URLRequest;

		public function Graphic() {
			// constructor code
			this.addListeners();
			this.urlReq = new URLRequest('assets/print/Prints.swf');
			this.myLoader.load(this.urlReq);
			loader.addChild(this.myLoader);
		}

		private function addListeners() {
			swapBtn.addEventListener(MouseEvent.CLICK, this.loadMovie);
			swapBtn.addEventListener(MouseEvent.MOUSE_OVER, this.hoverOver);
			swapBtn.addEventListener(MouseEvent.MOUSE_OUT, this.hoverOut);
		}

		private function hoverOver(e: MouseEvent) {
			if (this.gallery == false) swapBtn.gotoAndStop('upOver');
			else swapBtn.gotoAndStop('downOver');
		}

		private function hoverOut(e: MouseEvent) {
			if (this.gallery == false) swapBtn.gotoAndStop('up');
			else swapBtn.gotoAndStop('down');
		}

		private function loadMovie(e: MouseEvent) {
			if (this.gallery === false) {
				this.gallery = true;
				swapBtn.gotoAndStop('up');
				this.urlReq = new URLRequest('assets/print/Work.swf');
				this.myLoader.load(this.urlReq);
				loader.addChild(this.myLoader);
			} else {
				this.gallery = false;
				swapBtn.gotoAndStop('down');
				this.urlReq = new URLRequest('assets/print/Prints.swf');
				this.myLoader.load(this.urlReq);
				loader.addChild(this.myLoader);
			}
		}
	}
}