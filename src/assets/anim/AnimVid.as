package {

	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.net.navigateToURL;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.net.URLRequest;
	import flash.media.SoundTransform;
	import flash.media.Video;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.VideoEvent;
	import flash.events.AsyncErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.utils.Timer;

	import classes.CustomClick;
	import classes.CustomSlider;
	import classes.NavBtn;
	import classes.Playlist;
	import classes.ScrollNav;

	public class AnimVid extends MovieClip {

		public var audioVol: SoundTransform;
		public var btns: Array;
		public var checkVid: Timer;
		public const connection: NetConnection = new NetConnection();
		public var myPlaylist: Array;
		public var navBar: ScrollNav;
		public var playlistData: Playlist = new Playlist('assets/anim/vids.json');
		public var posControl: CustomSlider;
		public var stream: NetStream;
		public var totalDur: Number;
		public var vid: Video;
		public var vol: Number = .7;

		public function AnimVid() {
			// constructor code
			this.addListeners();
			this.posControl = new CustomSlider(posSlider, posSlider.posBar, posSlider.posBack);
			this.connection.connect(null);
			this.stream = new NetStream(this.connection);
			this.stream.addEventListener(AsyncErrorEvent.ASYNC_ERROR, this.asyncEvent);
			this.navBar = new ScrollNav(navi_mc);
			this.audioVol = new SoundTransform(this.vol);
			this.checkVid = new Timer(1000);
		}

		public function asyncEvent(e: Event) {
			trace(e);
		}

		private function addListeners() {
			btn_mailto.addEventListener(MouseEvent.CLICK, this.mailTo);
			this.playlistData.urlLoad.addEventListener(Event.COMPLETE, this.getPlaylist);
			playPause.addEventListener(MouseEvent.CLICK, this.toggleVideo);
			muteBtn.addEventListener(MouseEvent.CLICK, this.toggleSound);
			volUp.addEventListener(MouseEvent.CLICK, this.changeVol);
			volDown.addEventListener(MouseEvent.CLICK, this.changeVol);
		}

		private function adjustVol(adj: Number) {
			this.audioVol = new SoundTransform(adj);
			this.stream.soundTransform = this.audioVol;
		}

		private function btnEvents(obj: * , i: Number, arr: Array) {
			//this.vid.reset();
			obj['btn'].addEventListener(CustomClick.PLAY_CLICK, this.loadVideo);
			this.checkVid.start();
			this.checkVid.addEventListener(TimerEvent.TIMER, this.vidPos);
		}

		private function bufferStatus(e: NetStatusEvent) {
			switch (e.info.code) {
				case 'NetStream.Buffer.Full':
					{
						buffer.gotoAndPlay(2);
					}
				case 'NetStream.Buffer.Empty':
					{
						buffer.gotoAndStop(1);
					}
			}
		}

		private function changeVol(e: MouseEvent) {
			var btn = e.target.name;
			if (btn === 'volUp') {
				this.vol += .01;
			} else {
				this.vol -= .01;
			}
			if (this.vol > 1) this.vol = 1;
			if (this.vol < 0) this.vol = 0;
			this.adjustVol(this.vol);
		}

		private function getPlaylist(e) {
			this.myPlaylist = this.playlistData.getData()[0];
			this.btns = [
				new NavBtn(navi_mc.bee_btn, this.myPlaylist[0]),
				new NavBtn(navi_mc.cicada_btn, this.myPlaylist[1]),
				new NavBtn(navi_mc.fear_btn, this.myPlaylist[2]),
				new NavBtn(navi_mc.film_btn, this.myPlaylist[3]),
				new NavBtn(navi_mc.binaryBtn, this.myPlaylist[4]),
				new NavBtn(navi_mc.party_btn, this.myPlaylist[5]),
				new NavBtn(navi_mc.trans_btn, this.myPlaylist[6]),
				new NavBtn(navi_mc.travelBtn, this.myPlaylist[7]),
				new NavBtn(navi_mc.whileUSleep_btn, this.myPlaylist[8])
			];
			this.btns.forEach(this.btnEvents);
		}
		
		private function mailTo(e: MouseEvent) {
			navigateToURL(new URLRequest('mailto:prmast@projectmast.com'));
		}

		private function loadVideo(e: CustomClick) {
			var myVid = e.result;
			this.vid = new Video(myVid['width'], myVid['height']);
			this.totalDur = myVid['dur'];
			this.stream.play(myVid['url']);
			this.vid.attachNetStream(this.stream);
			vLoader.addChild(this.vid);
			this.stream.addEventListener(NetStatusEvent.NET_STATUS, this.bufferStatus);

		}

		private function toggleSound(e: MouseEvent) {
			var frame = muteBtn.currentFrameLabel;
			if (frame === 'onUp') {
				muteBtn.gotoAndStop('offUp');
				this.adjustVol(0);
			} else {
				muteBtn.gotoAndStop('onUp');
				this.adjustVol(this.vol);
			}
		}

		private function toggleVideo(e: MouseEvent) {
			var frame = playPause.currentFrameLabel;
			if (frame === 'onUp') {
				playPause.gotoAndStop('offUp');

			} else {
				playPause.gotoAndStop('onUp');

			}
			this.stream.togglePause()
		}

		private function vidPos(e: TimerEvent) {
			var loc = (this.stream.time / this.totalDur) / 100;
			this.posControl.setKnob(loc);
			if (loc === 1) {
				this.checkVid.reset();
				this.posControl.setKnob(0);
			}
		}
	}
}