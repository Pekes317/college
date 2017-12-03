var bufferingPlay:Number = 0;
var bufferOn:Boolean = false;
var vidNum:Number = 0; 

onEnterFrame = function () {
	if (_xmouse>132 && _xmouse<270) {
		if (_ymouse>125) {
			navi_mc.nextFrame();
		}
		if (_ymouse<425) {
			navi_mc.prevFrame();
	}
};
	if (vidNum == 1) {
		vLoader.viewer.load("videos/LivingInBinary.flv");
	} else if (vidNum == 2) {
		vLoader.viewer.load("videos/PartyLife.flv");
	} else if (vidNum == 3) {
		vLoader.viewer.load("videos/FearTheReaper.f4v");
	} else if (vidNum == 4) {
		vLoader.viewer.load("videos/BeeSwat.flv");
	} else if (vidNum == 5) {
		vLoader.viewer.load("videos/FilmGreat.flv");
	} else if (vidNum == 6) {
		vLoader.viewer.load("videos/WhileYouSleep.flv");
	} else if (vidNum == 7) {
		vLoader.viewer.load("videos/Transformation.flv");
	} else if (vidNum == 8) {
		vLoader.viewer.load("videos/TravelingBee.flv");
	} else if (vidNum == 9) {
		vLoader.viewer.load("videos/Cicada.flv");
	} 
	if (bufferOn) {
		bufferingPlay = bufferingPlay+1;
		if (bufferingPlay == 200) {
			bufferOn = false;
			loader.viewer.play();
			bufferingPlay = 0;
			buffer.gotoAndPlay(1);
		}
	};
};
navi.mc.liv_btn.onPress = function() {
	gotoAndStop(5);
	buffer.gotoAndPlay(2);
	bufferingPlay = 0;
	bufferOn = true;
	vidNum = 1
};
navi_mc.party_btn.onPress = function() {
	gotoAndStop(3);
	buffer.gotoAndPlay(2);
	bufferingPlay = 0;
	bufferOn = true;
	vidNum = 2
};
navi_mc.fear_btn.onPress = function() {
	gotoAndStop(4);
	buffer.gotoAndPlay(2);
	bufferingPlay = 0;
	bufferOn = true;
	vidNum = 3
};
navi_mc.bee_btn.onPress = function() {
	gotoAndStop(2);
	buffer.gotoAndPlay(2);
	bufferingPlay = 0;
	bufferOn = true;
	vidNum = 4
};
navi_mc.film_btn.onPress = function() {
	gotoAndStop(5);
	buffer.gotoAndPlay(2);
	bufferingPlay = 0;
	bufferOn = true;
	vidNum = 5
};
navi_mc.whileUSleep_btn.onPress = function() {
	gotoAndStop(4);
	buffer.gotoAndPlay(2);
	bufferingPlay = 0;
	bufferOn = true;
	vidNum = 6
};
navi_mc.trans_btn.onPress = function() {
	gotoAndStop(5);
	buffer.gotoAndPlay(2);
	bufferingPlay = 0;
	bufferOn = true;
	vidNum = 7
};
navi_mc.travBee_btn.onPress = function() {
	gotoAndStop(4);
	buffer.gotoAndPlay(2);
	bufferingPlay = 0;
	bufferOn = true;
	vidNum = 8
};
navi_mc.cicada_btn.onPress = function() {
	gotoAndStop(4);
	buffer.gotoAndPlay(2);
	bufferingPlay = 0;
	bufferOn = true;
	vidNum = 9
};
btn_mailto.onRelease = function (){
	getURL("mailto:prmast@projectmast.com?subject=Feedback")
};