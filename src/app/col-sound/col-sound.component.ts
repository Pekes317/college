import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';

@Component({
  selector: 'app-col-sound',
   host: { '(document:Flash)': 'startFlash($event)' },
  templateUrl: './col-sound.component.html',
  styleUrls: ['./col-sound.component.scss']
})
export class ColSoundComponent implements OnInit {
  @ViewChild('sound') sound: ElementRef;

  params = {
    play: true,
    loop: true,
    quality: 'high',
    wmode: 'transparent'
  };
  swf: swfobject.SwfObject;

  constructor() { }

  ngOnInit() { }

  startFlash(evt) {
    let el = this.sound.nativeElement;
    this.swf = swfobject;
    this.swf.embedSWF(
      'assets/sound/Sounds.swf', el,
      '1072', '603', '26', '', {}, this.params);
  }
}
