package classes {

	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel
	import flash.media.SoundTransform;
	import flash.utils.Timer;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class Audio {
		public var audioChannel: SoundChannel = new SoundChannel();
		public var audioTrans: SoundTransform = new SoundTransform();
		public var brief: String = 'No Text';
		public var currentTime: String;
		public var dur: String;
		public var estimatedLength: int;
		public var mp3: Sound = new Sound();
		public var mp3File: String;
		public var playback: Number;
		public var progressTimer: Timer;
		public var song: String;
		public var textLoader: URLLoader = new URLLoader();
		public var urlBrief: String;
		public var uuid: Number;		

		public function Audio(obj, vol) {
			// constructor code
			this.uuid = obj['id'];
			this.mp3File = obj['mp3'];
			this.song = obj['song'];
			this.dur = obj['dur'];
			this.urlBrief = obj['brief'];
			this.textLoader.addEventListener(Event.COMPLETE, loadText);
			this.textLoader.load(new URLRequest(this.urlBrief));
			this.audioTrans.volume = vol;
		}
		
		public function getCurrentTime(): String {
			var min = Math.floor(this.audioChannel.position / 1000 / 60);
			var sec = Math.floor(this.audioChannel.position / 1000) % 60;
			if (min < 10) min = '0' + min;
            if (sec < 10) sec = '0' + sec;
			this.currentTime = min + ':' + sec;
			return this.currentTime;
		}
		
		public function getCurrentPos(): Number {
			this.playback = this.audioChannel.position / estimatedLength;
			return this.playback;
		}

		public function loadSong() {
			this.mp3.load(new URLRequest(this.mp3File));
			if (this.progressTimer !== null) this.progressTimer.stop();
		}

		public function playSong(start: Number) {
			this.estimatedLength = Math.ceil(this.mp3.length / (this.mp3.bytesLoaded / this.mp3.bytesTotal));
			this.audioChannel = this.mp3.play(start);
			this.audioChannel.soundTransform = this.audioTrans;
			this.songProgress();
		}

		public function volumeLvl(level) {
			this.audioTrans.volume = level;
			this.audioChannel.soundTransform = this.audioTrans;
			this.getCurrentTime();
		}

		public function stopSong() {
			this.audioChannel.stop();
		}

		private function loadText(e: Event) {
			this.brief = this.textLoader.data;
			this.textLoader.removeEventListener(Event.COMPLETE, this.loadText);
		}

		private function songProgress() {
			this.progressTimer = new Timer(100);
			this.progressTimer.start();
		}
	}
}