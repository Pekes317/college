package classes {

	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;

	public class Playlist {
		public var songs: Array;
		public var urlLoad: URLLoader;
		
		private var urlRequest: URLRequest;
		
		public function Playlist(data) {
			// constructor code
			this.songs = new Array();
			this.urlLoad = new URLLoader();
			this.urlLoad.load(new URLRequest(data));
		}
		
		public function getData(): Array {
			var data = JSON.parse(this.urlLoad.data);
			this.songs.push(data);			
			return this.songs;
		}
	}

}