import {
  Component,
  ElementRef,
  NgZone,
  OnInit,
  ViewChild
} from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'college-col-nav',
  // tslint:disable-next-line: no-host-metadata-property
  host: {
    '(document:FlashNav)': 'myNav($event)',
    '(document:Flash)': 'startFlash($event)'
  },
  templateUrl: './col-nav.component.html',
  styleUrls: ['./col-nav.component.scss']
})
export class ColNavComponent implements OnInit {
  @ViewChild('FlashNav', { static: true }) flashNav: ElementRef;
  @ViewChild('mySwf', { static: true }) flash: ElementRef;

  params = {
    allowscriptaccess: 'sameDomain',
    play: true,
    loop: true,
    quality: 'high',
    wmode: 'transparent'
  };
  swf: swfobject.SwfObject;

  constructor(private router: Router, private zone: NgZone) {}

  ngOnInit() {
    if (window['swfobject'] !== undefined) {
      this.loadFlash();
    }
  }

  loadFlash() {
    const el = this.flashNav.nativeElement;
    this.swf = swfobject;
    this.zone.runOutsideAngular(() => {
      this.swf.embedSWF(
        'assets/nav/Navigation.swf',
        el,
        '682',
        '91',
        '26',
        '',
        {},
        this.params
      );
    });
  }

  startFlash() {
    this.loadFlash();
  }

  myNav(evt: CustomEvent) {
    const path = evt.detail;
    this.router.navigate([path]);
  }
}
