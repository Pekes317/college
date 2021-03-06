import { Component, ElementRef, HostListener, OnInit, ViewChild } from '@angular/core';

@Component({
  selector: 'college-col-web',
  templateUrl: './col-web.component.html',
  styleUrls: ['./col-web.component.scss']
})
export class ColWebComponent implements OnInit {
  @HostListener('document:Flash') flash = this.startFlash;
  @ViewChild('web', { static: true }) web: ElementRef;

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
    const el = this.web.nativeElement;
    this.swf = swfobject;
    this.swf.embedSWF('assets/web/web.swf', el, '1072', '603', '26', '', {}, this.params);
  }

  startFlash() {
    this.loadFlash();
  }
}
