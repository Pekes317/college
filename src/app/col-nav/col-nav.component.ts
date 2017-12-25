import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import 'swfobject';

@Component({
  selector: 'app-col-nav',
  host: { '(document:FlashNav)': 'myNav($event)' },
  templateUrl: './col-nav.component.html',
  styleUrls: ['./col-nav.component.scss']
})
export class ColNavComponent implements OnInit {

  @ViewChild('FlashNav') flashNav: ElementRef;

  params = {
    allowscriptaccess: 'sameDomain',
    play: true,
    loop: true,
    quality: 'high',
    wmode: 'transparent'
  };
  swf: swfobject.SwfObject = swfobject;

  constructor(private router: Router) { }

  ngOnInit() {
    let el = this.flashNav.nativeElement;
    this.swf.embedSWF(
      'assets/nav/Navigation.swf', el,
      '682', '91', '26', '', {}, this.params);
  }

  myNav(evt) {
    let path = evt['detail'];
    this.router.navigate([path]);
  }
}
