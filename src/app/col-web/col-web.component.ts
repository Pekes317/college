import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';

@Component({
  selector: 'app-col-web',
  host: { '(document:Flash)': 'startFlash($event)' },
  templateUrl: './col-web.component.html',
  styleUrls: ['./col-web.component.scss']
})
export class ColWebComponent implements OnInit {

  @ViewChild('web') web: ElementRef;

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
    let el = this.web.nativeElement;
    this.swf = swfobject;
    this.swf.embedSWF(
      'assets/web/Web.swf', el,
      '1072', '603', '26', '', {}, this.params)
  }

  startFlash(evt) {
    this.loadFlash();
  }
}
