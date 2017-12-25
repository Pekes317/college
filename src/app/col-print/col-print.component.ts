import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import 'swfobject';

@Component({
  selector: 'app-col-print',
  templateUrl: './col-print.component.html',
  styleUrls: ['./col-print.component.scss']
})
export class ColPrintComponent implements OnInit {

  @ViewChild('prints') aminVid: ElementRef;

  params = {
    play: true,
    loop: true,
    quality: 'high',
    wmode: 'transparent'
  };
  swf: swfobject.SwfObject = swfobject;

  constructor() { }

  ngOnInit() {
    let el = this.aminVid.nativeElement;
    this.swf.embedSWF(
      'assets/print/Graphic.swf', el,
      '1072', '603', '26', '', {}, this.params);
  }

}
