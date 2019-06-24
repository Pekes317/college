import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';

@Component({
  selector: 'college-col-amin-vid',
  host: { '(document:Flash)': 'startFlash($event)' },
  templateUrl: './col-amin-vid.component.html',
  styleUrls: ['./col-amin-vid.component.scss']
})
export class ColAminVidComponent implements OnInit {
  @ViewChild('animVid', { static: true }) aminVid: ElementRef;

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
    const el = this.aminVid.nativeElement;
    this.swf = swfobject;
    this.swf.embedSWF(
      'assets/anim/AnimVid.swf',
      el,
      '1072',
      '603',
      '26',
      '',
      {},
      this.params
    );
  }

  startFlash() {
    this.loadFlash();
  }
}
