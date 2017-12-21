package {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.navigateToURL;
	import flash.events.MouseEvent;
	import flash.display.Bitmap;
	import flash.net.URLRequest

	import classes.ag1;
	import classes.ag2;
	import classes.home;
	import classes.kungfu;
	import classes.lion;
	import classes.mario;
	import classes.Playlist;
	import classes.ScrollNav;

	public class Web extends MovieClip {

		public var urlData: Playlist;
		public var urlList: Array;
		public var nav: ScrollNav;
		public var webUrl: String;

		public function Web() {
			// constructor code
			this.urlData = new Playlist('assets/web/sites.json');
			this.addListener();
			this.nav = new ScrollNav(navi_mc)
		}

		private function addListener() {
			this.urlData.urlLoad.addEventListener(Event.COMPLETE, this.getList);
			btn_mailto.addEventListener(MouseEvent.CLICK, this.mailto);
			pageBtn.addEventListener(MouseEvent.CLICK, this.openPage);
			navi_mc.homeBtn.addEventListener(MouseEvent.CLICK, this.homeClick);
			navi_mc.firstBtn.addEventListener(MouseEvent.CLICK, this.firstClick);
			navi_mc.secondBtn.addEventListener(MouseEvent.CLICK, this.secondClick);
			navi_mc.afroBtn.addEventListener(MouseEvent.CLICK, this.afroClick);
			navi_mc.fableBtn.addEventListener(MouseEvent.CLICK, this.fableClick);
			navi_mc.powerBtn.addEventListener(MouseEvent.CLICK, this.powerClick);
		}

		private function afroClick(e: MouseEvent) {
			this.cleanViewer();
			var picObj: kungfu = new kungfu(-75, 10);
			var pic: Bitmap = new Bitmap(picObj);
			pic.x = -75;
			pic.y = 10;

			this.webUrl = this.urlList[0]['url'];
			viewer.addChild(pic);
		}

		private function cleanViewer() {
			while (viewer.numChildren > 0) {
				viewer.removeChildAt(0);
			}
		}

		private function fableClick(e) {
			this.cleanViewer();
			var picObj: lion = new lion(-75, 60);
			var pic: Bitmap = new Bitmap(picObj);
			pic.x = -75;
			pic.y = 60;

			this.webUrl = this.urlList[1]['url']
			viewer.addChild(pic);
		}

		private function firstClick(e: MouseEvent) {
			this.cleanViewer();
			var picObj: ag1 = new ag1(-60, 5);
			var pic: Bitmap = new Bitmap(picObj);
			pic.x = -60;
			pic.y = 5;

			this.webUrl = this.urlList[2]['url'];
			viewer.addChild(pic);
		}
		
		private function getList(e: Event) {
			this.urlList = this.urlData.getData()[0]
		}

		private function homeClick(e: MouseEvent) {
			this.cleanViewer();
			var picObj: home = new home(0, 0);
			var pic: Bitmap = new Bitmap(picObj);

			this.webUrl = this.urlList[3]['url'];
			viewer.addChild(pic);
		}

		private function openPage(e: MouseEvent) {
			if (this.webUrl != null) {
				navigateToURL(new URLRequest(webUrl), "_blank");
			}
		}

		private function mailto(e: MouseEvent): void {
			navigateToURL(new URLRequest("mailto:prmast@projectmast.com"), "_blank");
		}

		private function powerClick(e: MouseEvent) {
			this.cleanViewer();
			var picObj: mario = new mario(-65, 15);
			var pic: Bitmap = new Bitmap(picObj);
			pic.x = -65;
			pic.y = 15;

			this.webUrl = this.urlList[4]['url'];
			viewer.addChild(pic);
		}

		private function secondClick(e: MouseEvent) {
			this.cleanViewer();
			var picObj: ag2 = new ag2(-75, 10);
			var pic: Bitmap = new Bitmap(picObj);
			pic.x = -75;
			pic.y = 10;

			this.webUrl = this.urlList[5]['url'];
			viewer.addChild(pic);
		}
	}
}