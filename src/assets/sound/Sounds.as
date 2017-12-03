package {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import classes.Audio;
	import classes.CustomSlider;
	import classes.Playlist;
	import classes.SliderEvent;
	import flash.events.TimerEvent;

	public class Sounds extends MovieClip {
		public var btnArray: Array = new Array('info1', 'info2', 'info3', 'info4', 'dMix', 'mMix');
		public var currentMp3: Audio;
		public var currentTrack: Number = 0;
		public var myPlaylist: Array;
		public var mySongPos: Number = 0;
		public var myVol = 0.7;
		public var playlistData: Playlist;
		public var posControl: CustomSlider;
		public var posKnobMove: Boolean = false;
		public var volControl: CustomSlider;

		public function Sounds() {
			// constructor code
			this.playlistData = new Playlist('./assets/sound/songs.json');
			this.posControl = new CustomSlider(posSlider, posSlider.posBar, posSlider.posBack);
			this.volControl = new CustomSlider(volSlider, volSlider.volBar, volSlider.volTrack);
			this.addListeners();
			this.setVolume(this.myVol);
		}

		public function muteToggle(e: MouseEvent) {
			var frame = muteBtn.currentFrameLabel;
			if (frame === 'onUp') {
				muteBtn.gotoAndStop('offUp');
				this.currentMp3.volumeLvl(0);
			} else {
				muteBtn.gotoAndStop('onUp');
				this.currentMp3.volumeLvl(this.myVol);
			}
		}

		public function playToggle(e: MouseEvent) {
			var frame = playPause.currentFrameLabel;
			if (frame === 'onUp') {
				playPause.gotoAndStop('offUp');
				this.mySongPos = this.currentMp3.audioChannel.position;
				this.currentMp3.stopSong();
			} else {
				playPause.gotoAndStop('onUp');
				this.currentMp3.playSong(this.mySongPos);
			}
		}

		private function audioLoaded(e) {
			buffer.gotoAndStop(1);
			trackInfo.text = this.currentMp3.song;
			durInfo.text = this.currentMp3.dur;
			detail.htmlText = this.currentMp3.brief;
			posInfo.text = this.currentMp3.getCurrentTime();
			this.currentMp3.playSong(this.mySongPos);
			this.currentMp3.progressTimer.addEventListener(TimerEvent.TIMER, this.songPos);
			this.currentMp3.mp3.removeEventListener(Event.COMPLETE, audioLoaded);
			this.currentMp3.audioChannel.addEventListener(Event.SOUND_COMPLETE, this.songCompelete);
		}

		private function audioLoading() {
			buffer.gotoAndPlay(2);
			this.currentMp3.mp3.addEventListener(Event.COMPLETE, audioLoaded);
		}

		private function addListeners() {
			info1.addEventListener(MouseEvent.CLICK, this.playAudio);
			info2.addEventListener(MouseEvent.CLICK, this.playAudio);
			info3.addEventListener(MouseEvent.CLICK, this.playAudio);
			info4.addEventListener(MouseEvent.CLICK, this.playAudio);
			dMix.addEventListener(MouseEvent.CLICK, this.playAudio);
			mMix.addEventListener(MouseEvent.CLICK, this.playAudio);
			muteBtn.addEventListener(MouseEvent.CLICK, this.muteToggle);
			next_btn.addEventListener(MouseEvent.CLICK, this.nextAudio);
			playPause.addEventListener(MouseEvent.CLICK, this.playToggle);
			this.playlistData.urlLoad.addEventListener(Event.COMPLETE, this.getPlaylist);
			this.posControl.knob.addEventListener(SliderEvent.SLIDER_MOVE, songPosSlider);
			this.volControl.knob.addEventListener(SliderEvent.SLIDER_MOVE, volPosSlider);
		}

		private function getPlaylist(e) {
			this.myPlaylist = this.playlistData.getData()[0];
			this.currentMp3 = new Audio(this.myPlaylist[0], this.myVol);
			this.currentMp3.loadSong();
			this.audioLoading();
		}

		private function nextAudio(e: Event) {
			this.mySongPos = 0;
			var nextTrack = this.currentTrack + 1;
			this.currentMp3.stopSong();
			if (nextTrack === this.myPlaylist.length) {
				nextTrack = 0;
				this.currentMp3 = new Audio(this.myPlaylist[nextTrack], this.myVol);
			} else {
				this.currentMp3 = new Audio(this.myPlaylist[nextTrack], this.myVol);
			}
			this.currentTrack = nextTrack;

			this.currentMp3.loadSong();
			this.audioLoading();
		}

		private function playAudio(e: Event) {
			var i = this.btnArray.indexOf(e.target['name']);
			this.currentTrack = i;
			this.currentMp3.stopSong();
			this.currentMp3 = new Audio(this.myPlaylist[i], this.myVol);
			this.currentMp3.loadSong();
			this.mySongPos = 0;
			playPause.gotoAndStop('onUp');
			this.audioLoading();
		}

		private function posMove(e: Event) {
			this.posKnobMove = true;

		}

		private function setVolume(level) {
			this.volControl.setKnob(level);
		}

		private function songCompelete(e: Event) {
			this.nextAudio(e);
		}

		private function songPos(e: Event) {
			posInfo.text = this.currentMp3.getCurrentTime();
			if (!this.posKnobMove) this.posControl.setKnob(this.currentMp3.getCurrentPos());
		}

		protected function songPosSlider(e: SliderEvent) {
			this.posControl.knob.addEventListener(MouseEvent.MOUSE_DOWN, posMove);
			var newPos = this.currentMp3.estimatedLength * Number(e.result);
			this.currentMp3.stopSong();
			this.currentMp3.playSong(newPos);
			this.posKnobMove = false;
		}

		protected function volPosSlider(e: SliderEvent) {
			this.currentMp3.volumeLvl(e.result);
			this.myVol = e.result;
		}
	}
}