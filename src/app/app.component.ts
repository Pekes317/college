import { Component, OnInit } from '@angular/core';
import { detect } from 'detect-browser';

import { ColSwfService } from './shared/col-swf.service';
import { browser } from 'protractor';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  browser = detect();
  message: string = `This site is using flash which might not work on the ${this.browser['name']} browser.`;

  constructor(private swfLoader: ColSwfService) {}

  ngOnInit() {
    this.swfLoader.addSwfObject();
    if (this.browser['name'] === 'edge') {
      alert(this.message);
    }
  }
}
