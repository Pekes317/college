import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

//import * as actionCall from '../../scripts';

@Component({
  selector: 'app-col-nav',
  templateUrl: './col-nav.component.html',
  styleUrls: ['./col-nav.component.scss']
})
export class ColNavComponent implements OnInit {

  constructor(private router: Router) { }

  ngOnInit() { }

  ngOnChanges() {
    //console.log('Nav', actionCall);
  }

  goToAbout() {
    let path = 'about';
    this.router.navigate([path]);
  }
}
