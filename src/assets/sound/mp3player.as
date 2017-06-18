var mix:Sound = new Sound();
mix.onSoundComplete = playSong;
mix.setVolume(75);

var playList:Array = new Array();

var nowSong:Number = -1;

var pos:Number;
var currentPos:Number;
var min:String;
var sec:String;
var bufferingSound:Number = 0;
var pauser:Boolean = false;

var songs:XML = new XML();
songs.ignoreWhite = true;
songs.onLoad = function() {
	var nodes:Array = this.firstChild.childNodes;
	for (var i = 0; i<nodes.length; i++) {
		playList.push(new Song(nodes[i].attributes.url, nodes[i].attributes.song, nodes[i].attributes.dur));
	}
	playSong();
};
songs.load("songs.xml");

function playSong():Void {

	mix = new Sound();
	mix.onSoundComplete = playSong;
	mix.setVolume(75);
	mute.gotoAndStop("onUp");
	if (nowSong == playList.length-1) {
		nowSong = 0;
		mix.loadSound(playList[nowSong].earl,true);
	} else {
		mix.loadSound(playList[++nowSong].earl,true);
	}
	playPause.gotoAndStop("playUp");
	trackInfo.text = playList[nowSong].song;
	durInfo.text = playList[nowSong].dur;
	volBar._x = _root.volSlider._x+75;
	posSlider._x = posBack._x;
	bufferingSound = 0;
	buffer.gotoAndPlay(2);
	mix.stop();
}

function pauseIt():Void {
	pos = mix.position;
	mix.stop();
}

function unPauseIt():Void {
	mix.start(pos/1000);
}

playPause.onRollOver = function() {
	if (this._currentframe == 1) {
		this.gotoAndStop("playRoll");
	} else {
		this.gotoAndStop("pauseRoll");
	}
};
playPause.onRollOut = playPause.onReleaseOutside = function(){;
if(this._currentframe == 3 )this.gotoAndStop("playUp");
else this.gotoAndStop("pauseUp");
} ;
playPause.onRelease = function() {
	if (this._currentframe == 3) {
		this.gotoAndStop("pauseRoll");
		this._parent.pauseIt();
		pauser = true;
	} else {
		this.gotoAndStop("playRoll");
		this._parent.unPauseIt();
		pauser  = false;
	}
};
next_btn.onPress = function() {
	this.gotoAndStop("pressUp");
};
next_btn.onRollOver = function() {
	this.gotoAndStop("nextRoll");
};
next_btn.onRollOut = next_btn.onReleaseOutside=function () {
	this.gotoAndStop("nextUp");
};
next_btn.onRelease = function() {
	this._parent.playSong();
};

var mutting:Boolean = false;
mute.onRollOver = function() {
	if (this._currentframe == 1) {
		this.gotoAndStop("onRoll");
	} else {
		this.gotoAndStop("offRoll");
	}
};
mute.onRollOut = mute.onReleaseOutside = function(){;
	if(this._currentframe == 3 )this.gotoAndStop("onUp");
	else this.gotoAndStop("offUp");
} ;
mute.onRelease = function() {
	if (this._currentframe == 3) {
		this.gotoAndStop("offRoll");
		mix.setVolume(0);
		mutting = true;
	} else {
		this.gotoAndStop("onRoll");
		mix.setVolume(75);
		mutting = false;
	}
};
onEnterFrame = function(){;
	currentPos = Math.floor((mix.position/1000)%60);
	if(currentPos < 10){;
		sec = "0" + currentPos;
	} else{;
		sec = currentPos + "";
	};
	min = "0" + Math.floor((mix.position/1000)/60); ;
	posInfo.text = min + ":" + sec;
	mSP = Math.round(mix.position/1000);
	mSD = Math.round(mix.duration/1000);
	if(seeker == false){
		posSlider._x = startPosition + mSP/mSD *430;
	};	
	dT = posSlider._x - startPosition;
	pT = dT/430;
	dSP = pT * mSD;
	bufferingSound = bufferingSound+1;
	if(bufferingSound == 200){
		mix.start();
		buffer.gotoAndStop(1);
	};
};
volBar.onPress = function() {
	this.startDrag(false,_root.volSlider._x,_root.volSlider._y-3,_root.volSlider._x+145,_root.volSlider._y-3);
};
volBar.onRelease = volBar.onReleaseOutside=function () {
	stopDrag();
};
volBar.onMouseMove = function() {
	var myPoint:Object = new Object();
	myPoint.x = this._x;
	myPoint.y = this._y;
	_root.volSlider.globalToLocal(myPoint);
	if(mutting == false){
		mix.setVolume(myPoint.x);
	};
};
startPosition = posBack._x;
var seeker:Boolean = false;
posSlider.onPress = function() {
	this.startDrag(false,_root.posBack._x,_root.posBack._y-12,_root.posBack._x+430,_root.posBack._y-12);
	seeker = true;
};
posSlider.onRelease = posSlider.onReleaseOutside  = function () {
	stopDrag();
	/*if (pauser == true) {
		pos = dSP * 1000;
	} else {*/
	_root.mix.start(dSP, 0);
	//};
	seeker = false;
};

myData = new LoadVars();
myData.onLoad = function(){
   detail.htmlText = this.content;
};
myData.load("text/project_1.txt");

info1.onRelease = function(){
	myData.load("text/project_1.txt");
};
info2.onRelease = function(){
	myData.load("text/project_2.txt");
};
info3.onRelease = function(){
	myData.load("text/project_3.txt");
};
info4.onRelease = function(){
	myData.load("text/project_4.txt");
};
dMix.onRelease = function(){
	myData.load("text/dMix.txt");
};
mMix.onRelease = function(){
	myData.load("text/mMix.txt");
};
btn_mailto.onRelease = function (){
	getURL("mailto:prmast@projectmast.com?subject=Feedback")
};
stop();
