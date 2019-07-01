import { Component, ElementRef, HostListener, OnInit, ViewChild } from '@angular/core';

@Component({
  selector: 'college-col-sound',
  templateUrl: './col-sound.component.html',
  styleUrls: ['./col-sound.component.scss']
})
export class ColSoundComponent implements OnInit {
  @HostListener('document:Flash') flash = this.startFlash;
  @ViewChild('sound', { static: true }) sound: ElementRef;

  params = {
    play: true,
    loop: true,
    quality: 'high',
    wmode: 'transparent'
  };
  swf: swfobject.SwfObject;

  constructor() {}

  ngOnInit() {
    if (window['swfobject'] !== undefined) {
      this.loadFlash();
    }
  }

  loadFlash() {
    const el = this.sound.nativeElement;
    this.swf = swfobject;
    this.swf.embedSWF('assets/sound/Sounds.swf', el, '1072', '603', '26', '', {}, this.params);
  }

  startFlash() {
    this.loadFlash();
  }
}
