var webUrl: String;

pageBtn.addEventListener(MouseEvent.CLICK, openPage);

function openPage(e) {
	if (webUrl != null) {
		navigateToURL(new URLRequest(webUrl), "_blank");
	}
}

navi_mc.addEventListener(MouseEvent.MOUSE_OVER, fl_MouseOverHandler);

function fl_MouseOverHandler(event: MouseEvent): void {
	navi_mc.addEventListener(MouseEvent.MOUSE_WHEEL, fl_MouseWheelHandler);
}

function fl_MouseWheelHandler(event: MouseEvent): void {
	var i = navi_mc.currentFrame;
	i -= event.delta;

	navi_mc.gotoAndStop(i);
}

btn_mailto.addEventListener(MouseEvent.CLICK, mailto);

function mailto(event: MouseEvent): void {
	navigateToURL(new URLRequest("mailto:prmast@projectmast.com?subject=Feedback"), "_blank");
}

navi_mc.homeBtn.addEventListener(MouseEvent.CLICK, homeClick);

function homeClick(e) {
	cleanViewer();
	var picObj: home = new home();
	var pic: Bitmap = new Bitmap(picObj);

	webUrl = "https://college.projectmast.com";
	viewer.addChild(pic);
}

navi_mc.firstBtn.addEventListener(MouseEvent.CLICK, firstClick);

function firstClick(e) {
	cleanViewer();
	var picObj: ag1 = new ag1();
	var pic: Bitmap = new Bitmap(picObj);
	pic.x = -60;
	pic.y = 5;

	webUrl = "https://college.projectmast.com";
	viewer.addChild(pic);
}

navi_mc.secondBtn.addEventListener(MouseEvent.CLICK, secondClick);

function secondClick(e) {
	cleanViewer();
	var picObj: ag2 = new ag2();
	var pic: Bitmap = new Bitmap(picObj);
	pic.x = -75;
	pic.y = 10;

	webUrl = "https://college.projectmast.com";
	viewer.addChild(pic);
}

navi_mc.afroBtn.addEventListener(MouseEvent.CLICK, afroClick);

function afroClick(e) {
	cleanViewer();
	var picObj: kungfu = new kungfu();
	var pic: Bitmap = new Bitmap(picObj);
	pic.x = -75;
	pic.y = 10;

	webUrl = "https://college.projectmast.com";
	viewer.addChild(pic);
}

navi_mc.fableBtn.addEventListener(MouseEvent.CLICK, fableClick);

function fableClick(e) {
	cleanViewer();
	var picObj: lion = new lion();
	var pic: Bitmap = new Bitmap(picObj);
	pic.x = -75;
	pic.y = 60;

	webUrl = "https://college.projectmast.com";
	viewer.addChild(pic);
}

navi_mc.powerBtn.addEventListener(MouseEvent.CLICK, powerClick);

function powerClick(e) {
	cleanViewer();
	var picObj: mario = new mario();
	var pic: Bitmap = new Bitmap(picObj);
	pic.x = -65;
	pic.y = 15;

	webUrl = "https://college.projectmast.com";
	viewer.addChild(pic);
}

function cleanViewer() {
	while (viewer.numChildren > 0) {
		viewer.removeChildAt(0);
	}
}