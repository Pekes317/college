import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import 'swfobject';

@Component({
  selector: 'app-col-sound',
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
  swf: swfobject.SwfObject = swfobject;

  constructor() { }

  ngOnInit() {
    let el = this.sound.nativeElement;
    this.swf.embedSWF(
      'assets/sound/Sounds.swf', el,
      '1072', '603', '26', '', {}, this.params);
  }
}
