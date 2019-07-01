import { isPlatformBrowser } from '@angular/common';
import { Injectable, PLATFORM_ID, Inject } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ColSwfService {
  constructor(@Inject(PLATFORM_ID) private platformId: Object) {}

  addSwfObject() {
    if (isPlatformBrowser(this.platformId)) {
      const swfScript = document.createElement('script');
      swfScript.setAttribute('type', 'text/javascript');
      swfScript.setAttribute('src', 'assets/swfobject.js');
      swfScript.onload = () => {
        document.dispatchEvent(new CustomEvent('Flash', { bubbles: true }));
      };
      document.head.appendChild(swfScript);
    }
  }
}
