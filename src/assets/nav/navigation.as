import flash.external.ExternalInterface;

btn_home.addEventListener(MouseEvent.CLICK, homeClick);

function homeClick(e) {
	var url = new URLRequest('./');
	navigateToURL(url, '_self');
}

btn_img.addEventListener(MouseEvent.CLICK, imgClick);

function imgClick(e) {
	ExternalInterface.call('actionCall', 'images');
}

btn_anim.addEventListener(MouseEvent.CLICK, animClick);

function animClick(e) {
	var url = new URLRequest('./animation');
	navigateToURL(url, '_self');
}

btn_sound.addEventListener(MouseEvent.CLICK, soundClick);

function soundClick(e) {
	var url = new URLRequest('./sounds');
	navigateToURL(url, '_self');
}

btn_web.addEventListener(MouseEvent.CLICK, webClick);

function webClick(e) {
	var url = new URLRequest('./web');
	navigateToURL(url, '_self');
}

btn_about.addEventListener(MouseEvent.CLICK, aboutClick);

function aboutClick(e) {
	var url = new URLRequest('./about');
	navigateToURL(url, '_self');
}