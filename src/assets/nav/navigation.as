import flash.external.ExternalInterface;

btn_home.addEventListener(MouseEvent.CLICK, homeClick);

function homeClick(e) {
	ExternalInterface.call('actionCall', '');
}

btn_img.addEventListener(MouseEvent.CLICK, imgClick);

function imgClick(e) {
	ExternalInterface.call('actionCall', 'images');
}

btn_anim.addEventListener(MouseEvent.CLICK, animClick);

function animClick(e) {
	ExternalInterface.call('actionCall', 'animation');
}

btn_sound.addEventListener(MouseEvent.CLICK, soundClick);

function soundClick(e) {
	ExternalInterface.call('actionCall', 'sounds');
}

btn_web.addEventListener(MouseEvent.CLICK, webClick);

function webClick(e) {
	ExternalInterface.call('actionCall', 'web');
}

btn_about.addEventListener(MouseEvent.CLICK, aboutClick);

function aboutClick(e) {
	ExternalInterface.call('actionCall', 'about');
}