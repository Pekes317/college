import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-col-nav',
  host: {'(document:FlashNav)':'myNav($event)'},  
  templateUrl: './col-nav.component.html',
  styleUrls: ['./col-nav.component.scss']
})
export class ColNavComponent implements OnInit {

  constructor(private router: Router) {  }

  ngOnInit() { }

  myNav(evt) {
    let path = evt['detail'];
    this.router.navigate([path]);
  }
}
