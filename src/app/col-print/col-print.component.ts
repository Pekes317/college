import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';

@Component({
  selector: 'app-col-print',
  host: { '(document:Flash)': 'startFlash($event)' },
  templateUrl: './col-print.component.html',
  styleUrls: ['./col-print.component.scss']
})
export class ColPrintComponent implements OnInit {

  @ViewChild('prints') imgs: ElementRef;

  params = {
    play: true,
    loop: true,
    quality: 'high',
    wmode: 'transparent'
  };
  swf: swfobject.SwfObject;

  constructor() { }

  ngOnInit() { 
    if (window['swfobject'] !== undefined) {
      this.loadFlash();
    }
  }

  loadFlash() {
    let el = this.imgs.nativeElement;
    this.swf = swfobject;
    this.swf.embedSWF(
      'assets/print/Graphic.swf', el,
      '1072', '603', '26', '', {}, this.params);
  }

  startFlash(evt) {
    this.loadFlash();
  }
}
