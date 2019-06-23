package {

	import flash.external.ExternalInterface;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;

	public class Navigation extends MovieClip {

		public function Navigation() {
			// constructor code
			this.addListeners();
		}

		private function addListeners() {
			btn_home.addEventListener(MouseEvent.CLICK, this.homeClick);
			btn_img.addEventListener(MouseEvent.CLICK, this.imgClick);
			btn_anim.addEventListener(MouseEvent.CLICK, this.animClick);
			btn_sound.addEventListener(MouseEvent.CLICK, this.soundClick);
			btn_web.addEventListener(MouseEvent.CLICK, this.webClick);
			btn_about.addEventListener(MouseEvent.CLICK, this.aboutClick);
		}


		private function homeClick(e: MouseEvent) {
			ExternalInterface.call('actionCall', '');
		}

		private function imgClick(e: MouseEvent) {
			ExternalInterface.call('actionCall', 'images');
		}

		private function animClick(e: MouseEvent) {
			ExternalInterface.call('actionCall', 'animation');
		}

		private function soundClick(e: MouseEvent) {
			ExternalInterface.call('actionCall', 'sounds');
		}

		private function webClick(e: MouseEvent) {
			ExternalInterface.call('actionCall', 'web');
		}


		private function aboutClick(e: MouseEvent) {
			ExternalInterface.call('actionCall', 'about');
		}
	}

}