import { Component, OnInit } from '@angular/core';

import { ColSwfService } from './shared/col-swf.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title = 'College Works';
  
  constructor(private swfLoader: ColSwfService) {}

  ngOnInit() {
    this.swfLoader.addSwfObject();
  }
}
