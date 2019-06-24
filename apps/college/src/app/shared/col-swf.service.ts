import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ColSwfService {
  constructor() {}

  addSwfObject() {
    const swfScript = document.createElement('script');
    swfScript.setAttribute('type', 'text/javascript');
    swfScript.setAttribute('src', 'assets/swfobject.js');
    swfScript.onload = e => {
      document.dispatchEvent(new CustomEvent('Flash', { bubbles: true }));
    };
    document.head.appendChild(swfScript);
  }
}
