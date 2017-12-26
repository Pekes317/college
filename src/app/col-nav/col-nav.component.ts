import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-col-nav',
  host: { '(document:FlashNav)': 'myNav($event)', '(document:Flash)': 'startFlash($event)' },
  templateUrl: './col-nav.component.html',
  styleUrls: ['./col-nav.component.scss']
})
export class ColNavComponent implements OnInit {

  @ViewChild('FlashNav') flashNav: ElementRef;
  @ViewChild('mySwf') flash: ElementRef;

  params = {
    allowscriptaccess: 'sameDomain',
    play: true,
    loop: true,
    quality: 'high',
    wmode: 'transparent'
  };
  swf: swfobject.SwfObject;

  constructor(private router: Router) { }

  ngOnInit() {
    if (window['swfobject'] !== undefined) {
      this.loadFlash();
    }
  }

  loadFlash() {
    let el = this.flashNav.nativeElement;
    this.swf = swfobject;
    this.swf.embedSWF(
      'assets/nav/Navigation.swf', el,
      '682', '91', '26', '', {}, this.params);
  }

  startFlash(evt) {
    this.loadFlash();
  }

  myNav(evt) {
    let path = evt['detail'];
    this.router.navigate([path]);
  }
}
