package  {
	
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	
	import classes.CustomClick;
	import classes.ScrollNav;
	import classes.Playlist;
	import classes.NavBtn;
	
	public class Prints extends MovieClip {
		
		public var btns: Array;
		public var imgList: Array;
		public var imgListData: Playlist = new Playlist('assets/print/school.json');
		public var imgLoader = addChild(new Loader()) as Loader;
		public var printNav: ScrollNav;

		public function Prints() {
			// constructor code
			this.printNav = new ScrollNav(navi_mc);
			this.addListeners();
		}
		
		private function addListeners() {
			this.imgListData.urlLoad.addEventListener(Event.COMPLETE, this.getImgList);
			btn_mailto.addEventListener(MouseEvent.CLICK, this.mailTo);
		}
		
		private function btnEvents(obj: NavBtn , i: Number, arr: Array) {
			obj['btn'].addEventListener(CustomClick.PLAY_CLICK, this.loadImg);
		}
		
		private function getImgList(e: Event) {
			this.imgList = this.imgListData.getData()[0];
			this.btns = [
				new NavBtn(navi_mc.landBtn, this.imgList[0]),
				new NavBtn(navi_mc.conflictBtn, this.imgList[1]),
				new NavBtn(navi_mc.depthBtn, this.imgList[2]),
				new NavBtn(navi_mc.hierBtn, this.imgList[3]),
				new NavBtn(navi_mc.infinBtn, this.imgList[4]),
				new NavBtn(navi_mc.unityBtn, this.imgList[5]),
				new NavBtn(navi_mc.virtBtn, this.imgList[6]),
				new NavBtn(navi_mc.hellBtn, this.imgList[7])
			];
			this.btns.forEach(this.btnEvents);
		}
		
		private function loadImg(e: CustomClick) {
			this.imgLoader.unload();
			var myImg = e.result;
			this.imgLoader.x = myImg['x'];
			this.imgLoader.y = myImg['y'];
			this.imgLoader.load(new URLRequest(myImg['url']));
		}
		
		private function mailTo(e: MouseEvent) {
			navigateToURL(new URLRequest('mailto:prmast@projectmast.com'));
		}
	}
}