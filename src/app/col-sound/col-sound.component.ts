import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';

@Component({
  selector: 'app-col-sound',
  templateUrl: './col-sound.component.html',
  styleUrls: ['./col-sound.component.scss']
})
export class ColSoundComponent implements OnInit {
  @ViewChild('swf') swf: ElementRef;

  constructor() { }

  ngOnInit() {  }
}
