import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-col-nav',
  templateUrl: './col-nav.component.html',
  styleUrls: ['./col-nav.component.scss']
})
export class ColNavComponent implements OnInit {

  constructor(private router: Router) { }

  ngOnInit() { }

  goToAbout() {
    let path = 'about';
    this.router.navigate([path]);
  }

  goToAnim() {
    let path = 'animation';
    this.router.navigate([path]);
  }

  goToHome() {
    let path = '';
    this.router.navigate([path]);
  }
  goToImg() {
    let path = 'images';
    this.router.navigate([path]);
  }

  goToSound() {
    let path = 'sounds';
    this.router.navigate([path]);
  }

  goToWeb() {
    let path = 'web';
    this.router.navigate([path]);
  }
}
