import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import 'swfobject';

@Component({
  selector: 'app-col-web',
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
  swf: swfobject.SwfObject = swfobject;

  constructor() { }

  ngOnInit() {
    let el = this.web.nativeElement;
    this.swf.embedSWF(
      'assets/web/Web.swf', el,
      '1072', '603', '26', '', {}, this.params);
  }
}
