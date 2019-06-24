import { Component, OnInit } from '@angular/core';
import { detect } from 'detect-browser';

import { ColSwfService } from './shared/col-swf.service';

@Component({
  selector: 'college-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  private browser = detect();
  private message = `This site is using flash which might not work on the ${
    this.browser['name']
  } browser.`;

  constructor(private swfLoader: ColSwfService) {}

  public ngOnInit() {
    this.swfLoader.addSwfObject();
    if (this.browser['name'] === 'edge') {
      alert(this.message);
    }
  }
}
